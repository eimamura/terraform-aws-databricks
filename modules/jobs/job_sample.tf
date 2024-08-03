resource "databricks_job" "job_sample" {
  name        = local.job_sample
  description = "This job executes multiple tasks on a shared job cluster, which will be provisioned as part of execution, and terminated once all tasks are finished."

  job_cluster {
    # shared job cluster
    job_cluster_key = local.job_sample
    new_cluster {
      spark_version    = data.databricks_spark_version.latest.id
      instance_pool_id = databricks_instance_pool.smallest_nodes.id
      spark_conf = {
        "spark.databricks.cluster.profile" = "singleNode"
        "spark.master"                     = "local[*]"
      }
      custom_tags = {
        "ResourceClass" = "SingleNode"
      }
    }
  }

  task {
    # One of job_cluster_key, new_cluster, or existing_cluster_id must be specified
    task_key        = "task1"
    job_cluster_key = local.job_sample

    # new_cluster {
    #   num_workers   = 1
    #   spark_version = data.databricks_spark_version.latest.id
    #   node_type_id  = data.databricks_node_type.smallest.id
    # }

    notebook_task { notebook_path = databricks_notebook.nb1.path }
  }

  task {
    task_key        = "b"
    job_cluster_key = local.job_sample
    depends_on {
      task_key = "task1"
    }
    run_if = "ALL_DONE"
    # ALL_SUCCESS, AT_LEAST_ONE_SUCCESS, NONE_FAILED, ALL_DONE, AT_LEAST_ONE_FAILED or ALL_FAILED
    notebook_task { notebook_path = databricks_notebook.nb1.path }
  }

  task {
    task_key        = "c"
    job_cluster_key = local.job_sample
    notebook_task { notebook_path = databricks_notebook.nb1.path }
  }

  //this task starts a Delta Live Tables pipline update
  #   task {
  #     task_key = "d"

  #     pipeline_task {
  #       pipeline_id = databricks_pipeline.this.id
  #     }
  #   }
}
