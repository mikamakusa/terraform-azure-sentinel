data "azurerm_subscription" "this" {
  subscription_id = var.subscription_id
}

data "azurerm_resource_group" "this" {
  name  = var.resource_group_name
}

data "azurerm_log_analytics_workspace" "this" {
  name                = var.azurerm_log_analytics_workspace_name
  resource_group_name = data.azurerm_resource_group.this.name
}

data "azurerm_sentinel_alert_rule_anomaly" "this" {
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.this.id
  name                       = var.azurerm_sentinel_alert_rule_anomaly_name
}

data "azurerm_sentinel_alert_rule" "this" {
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.this.id
  name                       = var.azurerm_sentinel_alert_rule_name
}

data "azurerm_sentinel_alert_rule_template" "this" {
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.this.id
  name                       = var.azurerm_sentinel_alert_rule_template_name
}

data "azurerm_logic_app_standard" "this" {
  name                = var.logic_app_standard_name
  resource_group_name = data.azurerm_resource_group.this.name
}

data "azurerm_logic_app_workflow" "this" {
  name                = var.logic_app_workflow_name
  resource_group_name = data.azurerm_resource_group.this.name
}