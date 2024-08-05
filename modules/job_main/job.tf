resource "databricks_job" "job_main" {
  name        = local.job_cluster_key
  description = local.job_description
  tags        = var.tags


  # edit_mode = "UI_LOCKED"


  # health {
  #   rules {
  #     metric = "RUN_DURATION_SECONDS"
  #     op     = "GREATER_THAN"
  #     value  = 1
  #   }
  # }

  dynamic "email_notifications" {
    for_each = local.has_notifications ? [1] : []
    content {
      on_start                               = local.emails.on_start
      on_success                             = local.emails.on_success
      on_failure                             = local.emails.on_failure
      on_duration_warning_threshold_exceeded = local.emails.on_duration_warning_threshold_exceeded
    }
  }

  dynamic "schedule" {
    for_each = local.has_schedule ? [1] : []
    content {
      quartz_cron_expression = local.quartz_cron_expression
      timezone_id            = local.timezone_id
      pause_status           = local.pause_status
    }
  }

  job_cluster {
    job_cluster_key = local.job_cluster_key
    new_cluster {
      spark_version      = local.job_config.spark_version
      node_type_id       = local.job_config.node_type_id
      spark_conf         = local.job_config.spark_conf
      custom_tags        = local.job_config.custom_tags
      data_security_mode = "SINGLE_USER"
    }
  }

  git_source {
    url      = var.git_config.url
    branch   = var.git_config.branch
    provider = var.git_config.provider
  }

  dynamic "parameter" {
    for_each = local.job_parameters
    content {
      name    = parameter.key
      default = parameter.value
    }
  }

  dynamic "task" {
    for_each = local.tasks

    content {
      task_key        = task.value.task_key
      job_cluster_key = local.job_cluster_key
      run_if          = task.value.run_if

      dynamic "depends_on" {
        for_each = task.value.depends_on
        content {
          task_key = depends_on.value
        }
      }
      notebook_task {
        notebook_path = task.value.notebook_path
        source        = "GIT"
      }
    }
  }
}
