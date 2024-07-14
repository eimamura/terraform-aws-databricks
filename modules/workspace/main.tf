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

data "databricks_current_user" "me" {}

data "databricks_spark_version" "latest" {
  latest            = true
  long_term_support = true
}

data "databricks_node_type" "smallest" {
  local_disk = true
}
