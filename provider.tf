terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.39.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.43"
    }
  }
  required_version = ">= 1.7.5"
}

provider "aws" {
  region = "us-east-1"
}

# provider "http" {}

variable "client_id" {}
variable "client_secret" {}
variable "databricks_account_id" {}

module "e2" {
  source                = "./e2"
  client_id             = var.client_id
  client_secret         = var.client_secret
  databricks_account_id = var.databricks_account_id
}

module "workspace" {
  source           = "./workspace"
  databricks_host  = module.e2.databricks_host
  databricks_token = module.e2.databricks_token
}
