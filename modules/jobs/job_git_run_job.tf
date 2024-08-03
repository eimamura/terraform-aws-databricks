resource "databricks_job" "job_git_run_job" {
  name = local.job_git_run_job

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
    task_key = "task1"
    run_job_task {
      job_id = databricks_job.job_git.id
      job_parameters = {
        "param1" = "param1"
        "param2" = "param2"
      }
    }
  }
}
