# resource "databricks_instance_profile" "instance_profile" {
#   instance_profile_arn = "my_instance_profile_arn"
# }

# resource "databricks_user_role" "my_user_role" {
#   user_id = databricks_user.dummy.id
#   role    = databricks_instance_profile.instance_profile.id
# }

# resource "databricks_user_role" "my_user_account_admin" {
#   user_id = databricks_user.dummy.id
#   role    = "account_admin"
# }
