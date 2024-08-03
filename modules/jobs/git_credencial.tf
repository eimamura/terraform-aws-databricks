resource "databricks_git_credential" "ado" {
  git_username          = "eimamura"
  git_provider          = "github"
  personal_access_token = var.github_personal_access_token
}

resource "databricks_repo" "my_repo" {
  url = "https://github.com/eimamura/databricks-notebook.git"
}
