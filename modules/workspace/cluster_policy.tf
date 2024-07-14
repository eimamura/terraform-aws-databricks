resource "databricks_cluster_policy" "this" {
  name        = "Minimal (${data.databricks_current_user.me.alphanumeric})"
  description = "A minimal cluster policy"
  definition = jsonencode({
    "dbus_per_hour" : {
      "type" : "range",
      "maxValue" : 10
    },
    "autotermination_minutes" : {
      "type" : "fixed",
      "value" : 20,
      "hidden" : true
    }
  })
}
