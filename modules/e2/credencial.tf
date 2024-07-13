resource "time_sleep" "wait" {
  depends_on = [
    aws_iam_role.cross_account_role
  ]
  create_duration = "10s"
  # This issue can occur due to a race condition when the cross-account role configuration is applied by Terraform
  # reference: https://kb.databricks.com/terraform/failed-credential-validation-checks-error-with-terraform
}

resource "databricks_mws_credentials" "this" {
  provider         = databricks.mws
  role_arn         = aws_iam_role.cross_account_role.arn
  credentials_name = "${local.prefix}-creds"
  depends_on       = [aws_iam_role_policy.this, time_sleep.wait]
}
