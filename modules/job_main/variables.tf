variable "databricks_host" {}
variable "databricks_token" {}
variable "databricks_admin_user" {}

variable "github_personal_access_token" {}
variable "env" { default = "dev" }
variable "timezone_id" { default = "America/Sao_Paulo" }

variable "git_config" {
  type = object({
    username = string
    provider = string
    url      = string
    branch   = string
  })
  description = "Git configuration"
}

variable "tags" {
  type        = map(string)
  description = "Tags to be attached to the resources"
}
