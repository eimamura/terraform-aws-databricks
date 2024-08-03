resource "databricks_notebook" "nb1" {
  content_base64 = base64encode(<<-EOT
    # created from ${abspath(path.module)}
    display(spark.range(10))
    EOT
  )
  path     = "/Shared/Demo"
  language = "PYTHON"
}

# resource "databricks_notebook" "ddl" {
#   source = "${path.module}/DDLgen.py"
#   path   = "${data.databricks_current_user.me.home}/AA/BB/CC"
# }

# resource "databricks_notebook" "nb2" {
#   path     = "hello.py"
#   language = "PYTHON"
# }
