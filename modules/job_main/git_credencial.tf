resource "databricks_git_credential" "ado" {
  git_username          = var.git_config.username
  git_provider          = var.git_config.provider
  personal_access_token = var.github_personal_access_token
}
