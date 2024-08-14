module "log_analytics" {
  source    = "git@github.com:mikamakusa/terraform-azure-log-analytics.git?ref=1.0.1"
  workspace = var.workspace
  solution  = var.solution
}