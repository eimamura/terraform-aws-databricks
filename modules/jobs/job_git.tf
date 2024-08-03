resource "databricks_job" "job_git" {
  name = local.job_git

  health {
    rules {
      metric = "RUN_DURATION_SECONDS"
      op     = "GREATER_THAN"
      value  = 1
    }
  }

  email_notifications {
    # This block can be configured on both job and task levels
    on_start                               = [var.databricks_admin_user]
    on_success                             = []
    on_failure                             = []
    on_duration_warning_threshold_exceeded = []
  }

  schedule {
    quartz_cron_expression = "5 0 17 * * ?"
    timezone_id            = "America/Sao_Paulo"
    # pause_status = "UNPAUSED" # PAUSED or UNPAUSED
  }

  job_cluster {
    job_cluster_key = local.job_git
    new_cluster {
      spark_version    = data.databricks_spark_version.latest.id
      instance_pool_id = databricks_instance_pool.smallest_nodes.id
      spark_conf = {
        "spark.databricks.cluster.profile" = "singleNode"
        "spark.master"                     = "local[*]"
      }
      custom_tags = merge(
        local.tags_default, {
          "ResourceClass" = "SingleNode"
      })
    }
  }

  git_source {
    url      = "https://github.com/eimamura/databricks-notebook.git"
    branch   = "main"
    provider = "github"
  }

  parameter {
    name    = "param1"
    default = "job_level_param1"
  }
  parameter {
    name    = "param2"
    default = "job_level_param2"
  }

  task {
    task_key        = "task1"
    job_cluster_key = local.job_git
    notebook_task {
      notebook_path = "hello"
      base_parameters = {
        "param1" = "param1"
        "param2" = "param2"
      }
    }
  }
}
