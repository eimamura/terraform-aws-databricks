resource "databricks_git_credential" "ado" {
  git_username          = "eimamura"
  git_provider          = "gitHub"
  personal_access_token = var.github_personal_access_token
}

resource "databricks_repo" "my_repo" {
  url = local.git_repo_url
}
