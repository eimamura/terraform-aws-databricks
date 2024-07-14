
resource "databricks_cluster" "this" {
  cluster_name            = "Cluster managed by ${data.databricks_current_user.me.user_name}"
  spark_version           = data.databricks_spark_version.latest.id
  instance_pool_id        = databricks_instance_pool.smallest_nodes.id
  autotermination_minutes = 10
  autoscale {
    min_workers = 1
    max_workers = 5
  }
}
