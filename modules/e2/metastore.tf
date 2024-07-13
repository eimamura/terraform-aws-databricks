resource "databricks_metastore" "this" {
  provider      = databricks.mws
  name          = "my-metastore"
  owner         = var.databricks_admin_user
  region        = var.aws_region
  force_destroy = true
}

resource "databricks_metastore_assignment" "default_metastore" {
  provider             = databricks.mws
  workspace_id         = databricks_mws_workspaces.this.workspace_id
  metastore_id         = databricks_metastore.this.id
  default_catalog_name = "hive_metastore"
}
