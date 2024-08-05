locals {
  has_schedule           = true
  quartz_cron_expression = "5 0 17 * * ?"
  timezone_id            = var.timezone_id
  pause_status           = "UNPAUSED" # PAUSED or UNPAUSED
}
