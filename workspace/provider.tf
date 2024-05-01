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

provider "databricks" {
  host  = var.databricks_host
  token = var.databricks_token
}
