locals {
  prefix          = "job-"
  job_cluster_key = "${local.prefix}git"
  job_description = "This job executes multiple tasks on a shared job cluster, which will be provisioned as part of execution, and terminated once all tasks are finished."

  job_config = {
    job_cluster_key = "job-cluster"
    num_workers     = 0
    spark_version   = "15.2.x-cpu-ml-scala2.12"
    node_type_id    = "i3.xlarge"
    spark_conf = {
      "spark.databricks.cluster.profile" = "singleNode"
      "spark.master"                     = "local[*]"
    }
    custom_tags = merge(
      var.tags, {
        "ResourceClass" = "SingleNode"
    })
  }

  job_parameters = {
    param1 = "job_level_param1"
    param2 = "job_level_param2"
  }
}
