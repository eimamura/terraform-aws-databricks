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
  region = "us-east-1"
}

// initialize provider in "MWS" mode to provision new workspace
provider "databricks" {
  alias         = "mws"
  host          = "https://accounts.cloud.databricks.com"
  account_id    = var.databricks_account_id
  client_id     = var.client_id
  client_secret = var.client_secret
}

module "e2" {
  source                = "./e2"
  providers             = { databricks.mws = databricks.mws }
  client_id             = var.client_id
  client_secret         = var.client_secret
  databricks_account_id = var.databricks_account_id
}

provider "databricks" {
  alias = "ws"
  host  = module.e2.databricks_host
  token = module.e2.databricks_token
}

module "workspace" {
  source           = "./workspace"
  providers        = { databricks = databricks.ws }
  databricks_host  = module.e2.databricks_host
  databricks_token = module.e2.databricks_token
  depends_on       = [module.e2]
}
