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

// initialize provider in "MWS" mode to provision new workspace
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
