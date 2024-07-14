data "databricks_group" "admins" {
  display_name = "admins"
}

resource "databricks_user" "admin_user" {
  user_name = var.databricks_admin_user
}

resource "databricks_group_member" "i-am-admin" {
  group_id  = data.databricks_group.admins.id
  member_id = databricks_user.admin_user.id
}


resource "databricks_group" "spectators" {
  display_name = "Spectators (by ${data.databricks_current_user.me.alphanumeric})"
}

resource "databricks_user" "dummy" {
  user_name    = "dummy+${data.databricks_current_user.me.alphanumeric}@example.com"
  display_name = "Dummy ${data.databricks_current_user.me.alphanumeric}"
}

resource "databricks_group_member" "a" {
  group_id  = databricks_group.spectators.id
  member_id = databricks_user.dummy.id
}
