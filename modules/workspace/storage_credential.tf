data "aws_caller_identity" "current" {}

//generate a random string as the prefix for AWS resources, to ensure uniqueness
resource "random_string" "naming" {
  special = false
  upper   = false
  length  = 6
}

locals {
  prefix = "demo${random_string.naming.result}"
}

locals {
  uc_iam_role = "${local.prefix}-uc-access"
}

# resource "databricks_storage_credential" "external" {
#   name = "${local.prefix}-external-access"
#   //cannot reference aws_iam_role directly, as it will create circular dependency
#   aws_iam_role {
#     role_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${local.uc_iam_role}"
#   }
#   comment = "Managed by TF"
# }

# resource "databricks_grants" "external_creds" {
#   storage_credential = databricks_storage_credential.external.id
#   grant {
#     principal  = "users"
#     privileges = ["CREATE_TABLE"]
#   }
# }
