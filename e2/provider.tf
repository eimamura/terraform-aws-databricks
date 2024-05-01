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

// initialize provider in "MWS" mode to provision new workspace
provider "databricks" {
  alias         = "mws"
  host          = "https://accounts.cloud.databricks.com"
  account_id    = var.databricks_account_id
  client_id     = var.client_id
  client_secret = var.client_secret
}
