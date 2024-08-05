locals {
  prefix = "job-"

  # cluster_config = {
  #   driver_node_type_id = "i3.xlarge"
  #   node_type_id        = "i3.xlarge"
  #   spark_version       = "15.2.x-cpu-ml-scala2.12"
  # }

  # job_config = {
  #   job_cluster_key = "job-cluster"
  #   num_workers     = 2
  #   spark_version   = "15.2.x-cpu-ml-scala2.12"
  #   node_type_id    = "i3.xlarge"
  # }

  git_config = {
    url      = "https://github.com/eimamura/databricks-notebook.git/"
    username = "eimamura"
    provider = "gitHub"
    branch   = "main"
  }

  tags = {
    Environment = var.env
    WorkLoad    = "mlpricing"
    ManagedBy   = "terraform"
  }
}
