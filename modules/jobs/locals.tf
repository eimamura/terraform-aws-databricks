
locals {
  smallest_node_type_id = data.databricks_node_type.smallest.id
  job_sample            = "job_sample"
  job_git               = "job_git"
  job_git_run_job       = "job_git_run_job"
  tags_default = {
    "Environment" = "Production"
    "Project"     = "ProjectA"
  }
}
