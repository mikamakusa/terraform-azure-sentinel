module "log_analytics" {
  source    = "modules/terraform-azure-log-analytics"
  workspace = var.workspace
  solution  = var.solution
  resource_group_name = var.resource_group_name
}