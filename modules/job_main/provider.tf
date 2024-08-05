terraform {
  required_providers {
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
