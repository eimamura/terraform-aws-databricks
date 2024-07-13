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
