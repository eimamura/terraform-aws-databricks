terraform {
  required_providers {
    # local_provider_name
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.47.0"
    }
    databricks = {
      source  = "databricks/databricks"
      version = ">= 1.41.0"
    }
  }
  required_version = ">= 1.8.2"
}

provider "aws" {
  region = var.aws_region
}

// initialize provider in "MWS" mode for account-level resources
provider "databricks" {
  alias         = "mws"
  host          = "https://accounts.cloud.databricks.com"
  account_id    = var.databricks_account_id
  client_id     = var.databricks_client_id
  client_secret = var.databricks_client_secret
}

module "e2" {
  # source                   = "./modules/e2_v2"
  source                   = "./modules/e2"
  providers                = { databricks.mws = databricks.mws }
  databricks_account_id    = var.databricks_account_id
  databricks_client_id     = var.databricks_client_id
  databricks_client_secret = var.databricks_client_secret
  aws_region               = var.aws_region
  databricks_admin_user    = var.databricks_admin_user
}

// initialize provider at workspace level, to create UC resources
provider "databricks" {
  alias = "ws"
  host  = module.e2.databricks_host
  token = module.e2.databricks_token
}

module "workspace" {
  source                = "./modules/workspace"
  providers             = { databricks = databricks.ws }
  databricks_host       = module.e2.databricks_host
  databricks_token      = module.e2.databricks_token
  databricks_admin_user = var.databricks_admin_user
  depends_on            = [module.e2]
}

# module "jobs" {
#   source                       = "./modules/jobs"
#   providers                    = { databricks = databricks.ws }
#   databricks_host              = module.e2.databricks_host
#   databricks_token             = module.e2.databricks_token
#   databricks_admin_user        = var.databricks_admin_user
#   github_personal_access_token = var.github_personal_access_token
#   depends_on                   = [module.workspace]
# }

module "job_main" {
  source                       = "./modules/job_main"
  providers                    = { databricks = databricks.ws }
  databricks_host              = module.e2.databricks_host
  databricks_token             = module.e2.databricks_token
  databricks_admin_user        = var.databricks_admin_user
  github_personal_access_token = var.github_personal_access_token
  git_config                   = local.git_config
  tags                         = local.tags
  env                          = var.env
  depends_on                   = [module.workspace]
}
