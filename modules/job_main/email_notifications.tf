locals {
  has_notifications = true
  emails = {
    on_success                             = [var.databricks_admin_user]
    on_failure                             = [var.databricks_admin_user]
    on_start                               = []
    on_duration_warning_threshold_exceeded = []
  }
}
