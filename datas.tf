data "azurerm_subscription" "this" {
  count           = var.subscription_id ? 1 : 0
  subscription_id = var.subscription_id
}

data "azurerm_resource_group" "this" {
  count = var.resource_group_name ? 1 : 0
  name  = var.resource_group_name
}

data "azurerm_log_analytics_workspace" "this" {
  count               = var.azurerm_log_analytics_workspace_name ? 1 : 0
  name                = var.azurerm_log_analytics_workspace_name
  resource_group_name = data.azurerm_resource_group.this.name
}

data "azurerm_sentinel_alert_rule_anomaly" "this" {
  count                      = var.azurerm_sentinel_alert_rule_anomaly_name ? 1 : 0
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.this.id
  name                       = var.azurerm_sentinel_alert_rule_anomaly_name
}

data "azurerm_sentinel_alert_rule" "this" {
  count                      = var.azurerm_sentinel_alert_rule_name ? 1 : 0
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.this.id
  name                       = var.azurerm_sentinel_alert_rule_name
}

data "azurerm_sentinel_alert_rule_template" "this" {
  count                      = var.azurerm_sentinel_alert_rule_template_name ? 1 : 0
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.this.id
  name                       = var.azurerm_sentinel_alert_rule_template_name
}

data "azurerm_logic_app_standard" "this" {
  count               = var.logic_app_standard_name ? 1 : 0
  name                = var.logic_app_standard_name
  resource_group_name = data.azurerm_resource_group.this.name
}

data "azurerm_logic_app_workflow" "this" {
  count               = var.logic_app_workflow_name ? 1 : 0
  name                = var.logic_app_workflow_name
  resource_group_name = data.azurerm_resource_group.this.name
}