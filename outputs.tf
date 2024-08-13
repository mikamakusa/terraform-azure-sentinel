## ANALYTICS WORKSPACE ##

output "workspace_id" {
  value = try(
    azurerm_log_analytics_workspace.this.*.id
  )
}

output "workspace_name" {
  value = try(
    azurerm_log_analytics_workspace.this.*.name
  )
}

output "workspace_workspace_id" {
  value = try(
    azurerm_log_analytics_workspace.this.*.workspace_id
  )
}

output "workspace_resource_group_name" {
  value = try(
    azurerm_log_analytics_workspace.this.*.resource_group_name
  )
}

## ANALYTICS SOLUTION ##

output "analytics_solution_id" {
  value = try(
    azurerm_log_analytics_solution.this.*.id
  )
}

output "analytics_solution_name" {
  value = try(
    azurerm_log_analytics_solution.this.*.solution_name
  )
}

## ANALYTICS WORKSPACE ONBOARDING ##

output "analytics_workspace_onboarding_id" {
  value = try(
    azurerm_sentinel_log_analytics_workspace_onboarding.this.*.id
  )
}

## ALERT RULE MACHINE LEARNING BEHAVIOR ANALYTICS ##

output "machine_learning_behavior_analytics_id" {
  value = try(
    azurerm_sentinel_alert_rule_machine_learning_behavior_analytics.this.*.id
  )
}

output "machine_learning_behavior_analytics_name" {
  value = azurerm_sentinel_alert_rule_machine_learning_behavior_analytics.this.*.name
}

## ALERT RULE ANOMALY BUILT IN ##

output "alert_rule_anomaly_built_in_id" {
  value = try(
    azurerm_sentinel_alert_rule_anomaly_built_in.this.*.id
  )
}

output "alert_rule_anomaly_built_in_name" {
  value = try(
    azurerm_sentinel_alert_rule_anomaly_built_in.this.*.name
  )
}

## ALERT RULE ANOMALY DUPLICATE ##

output "alert_rule_anomaly_duplicate_id" {
  value = try(
    azurerm_sentinel_alert_rule_anomaly_duplicate.this.*.id
  )
}

output "alert_rule_anomaly_duplicate_name" {
  value = try(
    azurerm_sentinel_alert_rule_anomaly_duplicate.this.*.name
  )
}

## ALERT RULE FUSION ##

output "alert_rule_fusion_id" {
  value = try(
    azurerm_sentinel_alert_rule_fusion.this.*.id
  )
}

output "alert_rule_fusion_name" {
  value = try(
    azurerm_sentinel_alert_rule_fusion.this.*.name
  )
}

## MS SECURITY INCIDENT ##

output "ms_security_incident_id" {
  value = try(
    azurerm_sentinel_alert_rule_ms_security_incident.this.*.id
  )
}

output "ms_security_incident_name" {
  value = try(
    azurerm_sentinel_alert_rule_ms_security_incident.this.*.name
  )
}

## ALERT RULE NRT ##

output "alert_rule_nrt_id" {
  value = try(
    azurerm_sentinel_alert_rule_nrt.this.*.id
  )
}

output "alert_rule_nrt_name" {
  value = try(
    azurerm_sentinel_alert_rule_nrt.this.*.name
  )
}

## ALERT RULE SCHEDULED ##

output "alert_rule_scheduled_id" {
  value = try(
    azurerm_sentinel_alert_rule_scheduled.this.*.id
  )
}

output "aler_rule_scheduled_name" {
  value = try(
    azurerm_sentinel_alert_rule_scheduled.this.*.name
  )
}

## ALERT RULE THREAT INTELLIGENCE ##

output "alert_rule_threat_intelligence_id" {
  value = try(
    azurerm_sentinel_alert_rule_threat_intelligence.this.*.id
  )
}

output "alert_rule_threat_intelligence_name" {
  value = try(
    azurerm_sentinel_alert_rule_threat_intelligence.this.*.name
  )
}

## AUTOMATION RULE ##

output "automation_rule_id" {
  value = try(
    azurerm_sentinel_automation_rule.this.*.id
  )
}

output "automation_rule_name" {
  value = try(
    azurerm_sentinel_automation_rule.this.*.name
  )
}

## DATA CONNECTOR AWS CLOUD TRAIL ##

output "data_connector_aws_cloud_trail_id" {
  value = try(
    azurerm_sentinel_data_connector_aws_cloud_trail.this.*.id
  )
}

output "data_connector_aws_cloud_trail_name" {
  value = try(
    azurerm_sentinel_data_connector_aws_cloud_trail.this.*.name
  )
}

## DATA CONNECTOR AWS S3 ##

output "data_connector_aws_s3_id" {
  value = try(
    azurerm_sentinel_data_connector_aws_s3.this.*.id
  )
}

output "data_connector_aws_s3_name" {
  value = try(
    azurerm_sentinel_data_connector_aws_s3.this.*.name
  )
}

## DATA CONNECTOR AZURE ACTIVE DIRECTORY ##

output "data_connector_aad_id" {
  value = try(
    azurerm_sentinel_data_connector_azure_active_directory.this.*.id
  )
}

output "data_connector_aad_name" {
  value = try(
    azurerm_sentinel_data_connector_azure_active_directory.this.*.name
  )
}

## DATA CONNECTOR AZURE ADVANCED THREAT PROTECTION ##

output "data_connector_aatp_id" {
  value = try(
    azurerm_sentinel_data_connector_azure_advanced_threat_protection.this.*.id
  )
}

output "data_connector_aatp_name" {
  value = try(
    azurerm_sentinel_data_connector_azure_advanced_threat_protection.this.*.name
  )
}