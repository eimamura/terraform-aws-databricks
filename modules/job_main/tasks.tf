locals {
  notebook_root_path = ""
  # run_if: ALL_SUCCESS, AT_LEAST_ONE_SUCCESS, NONE_FAILED, ALL_DONE, AT_LEAST_ONE_FAILED or ALL_FAILED

  tasks = [
    {
      task_key      = "1"
      notebook_path = "${local.notebook_root_path}hello"
      depends_on    = []
      run_if        = "ALL_SUCCESS"
    },
    {
      task_key      = "2"
      notebook_path = "${local.notebook_root_path}hello"
      depends_on    = ["1"]
      run_if        = "ALL_DONE"
    },
    {
      task_key      = "3"
      notebook_path = "${local.notebook_root_path}hello"
      depends_on    = ["1"]
      run_if        = "ALL_SUCCESS"
    },
  ]
}
