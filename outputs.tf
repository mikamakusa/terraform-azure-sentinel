output "log_analytics_workspace_onboarding" {
  value = {
    for a in azurerm_sentinel_log_analytics_workspace_onboarding.this : a => {
      id = a.id
    }
  }
}

output "alert_rule_machine_learning_behavior_analytics" {
  value = {
    for a in azurerm_sentinel_alert_rule_machine_learning_behavior_analytics.this : a => {
      id = a.id
    }
  }
}

output "alert_rule_anomaly_built_in" {
  value = {
    for a in azurerm_sentinel_alert_rule_anomaly_built_in.this : a => {
      id                              = a.id
      anomaly_settings_version        = a.anomaly_settings_version
      anomaly_version                 = a.anomaly_version
      description                     = a.description
      frequency                       = a.frequency
      settings_definition_id          = a.settings_definition_id
      tactics                         = a.tactics
      techniques                      = a.techniques
      multi_select_observation        = a.multi_select_observation
      single_select_observation       = a.single_select_observation
      prioritized_exclude_observation = a.prioritized_exclude_observation
      threshold_observation           = a.threshold_observation
    }
  }
}

output "alert_rule_anomaly_duplicate" {
  value = {
    for a in azurerm_sentinel_alert_rule_anomaly_duplicate.this : a => {
      id                       = a.id
      anomaly_settings_version = a.anomaly_settings_version
      anomaly_version          = a.anomaly_version
      description              = a.description
      frequency                = a.frequency
      settings_definition_id   = a.settings_definition_id
      tactics                  = a.tactics
      techniques               = a.techniques
      is_default_settings      = a.is_default_settings
    }
  }
}

output "alert_rule_fusion" {
  value = {
    for a in azurerm_sentinel_alert_rule_fusion.this : a => {
      id   = a.id
      name = a.name
    }
  }
}

output "alert_rule_ms_security_incident" {
  value = {
    for a in azurerm_sentinel_alert_rule_ms_security_incident.this : a => {
      id                          = a.id
      name                        = a.name
      product_filter              = a.product_filter
      severity_filter             = a.severity_filter
      description                 = a.description
      display_name                = a.display_name
      display_name_exclude_filter = a.display_name_exclude_filter
      display_name_filter         = a.display_name_filter
    }
  }
}

output "alert_rule_nrt" {
  value = {
    for a in azurerm_sentinel_alert_rule_nrt.this : a => {
      id                          = a.id
      display_name                = a.display_name
      name                        = a.name
      severity                    = a.severity
      tactics                     = a.tactics
      incident                    = a.incident
      alert_details_override      = a.alert_details_override
      alert_rule_template_guid    = a.alert_rule_template_guid
      alert_rule_template_version = a.alert_rule_template_version
      entity_mapping              = a.entity_mapping
      event_grouping              = a.event_grouping
    }
  }
}

output "alert_rule_scheduled" {
  value = {
    for a in azurerm_sentinel_alert_rule_scheduled.this : a => {
      id                          = a.id
      display_name                = a.display_name
      name                        = a.name
      severity                    = a.severity
      tactics                     = a.tactics
      incident                    = a.incident
      alert_details_override      = a.alert_details_override
      alert_rule_template_guid    = a.alert_rule_template_guid
      alert_rule_template_version = a.alert_rule_template_version
      entity_mapping              = a.entity_mapping
      event_grouping              = a.event_grouping
    }
  }
}

output "alert_rule_threat_intelligence" {
  value = {
    for a in azurerm_sentinel_alert_rule_threat_intelligence.this : a => {
      id                       = a.id
      name                     = a.name
      alert_rule_template_guid = a.alert_rule_template_guid
    }
  }
}

output "automation_rule" {
  value = {
    for a in azurerm_sentinel_automation_rule.this : a => {
      id              = a.id
      display_name    = a.display_name
      name            = a.name
      order           = a.order
      action_incident = a.action_incident
      action_playbook = a.action_playbook
      condition_json  = a.condition_json
      enabled         = a.enabled
      expiration      = a.expiration
    }
  }
}

output "data_connector_aws_cloud_trail" {
  value = {
    for a in azurerm_sentinel_data_connector_aws_cloud_trail.this : a => {
      id           = a.id
      name         = a.name
      aws_role_arn = a.aws_role_arn
    }
  }
}

output "data_connector_aws_s3" {
  value = {
    for a in azurerm_sentinel_data_connector_aws_s3.this : a => {
      id                = a.id
      name              = a.name
      aws_role_arn      = a.aws_role_arn
      destination_table = a.destination_table
      sqs_urls          = a.sqs_urls
    }
  }
}

output "data_connector_azure_active_directory" {
  value = {
    for a in azurerm_sentinel_data_connector_azure_active_directory.this : a => {
      id   = a.id
      name = a.name
    }
  }
}

output "data_connector_azure_security_center" {
  value = {
    for a in azurerm_sentinel_data_connector_azure_security_center.this : a => {
      id   = a.id
      name = a.name
    }
  }
}

output "data_connector_iot" {
  value = {
    for a in azurerm_sentinel_data_connector_iot.this : a => {
      id   = a.id
      name = a.name
    }
  }
}

output "data_connector_microsoft_cloud_app_security" {
  value = {
    for a in azurerm_sentinel_data_connector_microsoft_cloud_app_security.this : a => {
      id   = a.id
      name = a.name
    }
  }
}

output "data_connector_dynamics_365" {
  value = {
    for a in azurerm_sentinel_data_connector_dynamics_365.this : a => {
      id   = a.id
      name = a.name
    }
  }
}

output "data_connector_microsoft_defender_advanced_threat_protection" {
  value = {
    for a in azurerm_sentinel_data_connector_microsoft_defender_advanced_threat_protection.this : a => {
      id   = a.id
      name = a.name
    }
  }
}

output "data_connector_azure_advanced_threat_protection" {
  value = {
    for a in azurerm_sentinel_data_connector_azure_advanced_threat_protection.this : a => {
      id   = a.id
      name = a.name
    }
  }
}

output "data_connector_microsoft_threat_intelligence" {
  value = {
    for a in azurerm_sentinel_data_connector_microsoft_threat_intelligence.this : a => {
      id   = a.id
      name = a.name
    }
  }
}

output "data_connector_microsoft_threat_protection" {
  value = {
    for a in azurerm_sentinel_data_connector_microsoft_threat_protection.this : a => {
      id   = a.id
      name = a.name
    }
  }
}

output "data_connector_office_365" {
  value = {
    for a in azurerm_sentinel_data_connector_office_365.this : a => {
      id   = a.id
      name = a.name
    }
  }
}

output "data_connector_office_365_project" {
  value = {
    for a in azurerm_sentinel_data_connector_office_365_project.this : a => {
      id   = a.id
      name = a.name
    }
  }
}

output "data_connector_office_atp" {
  value = {
    for a in azurerm_sentinel_data_connector_office_atp.this : a => {
      id   = a.id
      name = a.name
    }
  }
}

output "data_connector_office_irm" {
  value = {
    for a in azurerm_sentinel_data_connector_office_irm.this : a => {
      id   = a.id
      name = a.name
    }
  }
}

output "data_connector_office_power_bi" {
  value = {
    for a in azurerm_sentinel_data_connector_office_power_bi.this : a => {
      id   = a.id
      name = a.name
    }
  }
}

output "data_connector_threat_intelligence_taxii" {
  value = {
    for a in azurerm_sentinel_data_connector_threat_intelligence_taxii.this : a => {
      id           = a.id
      display_name = a.display_name
      name         = a.name
    }
  }
}

output "metadata" {
  value = {
    for a in azurerm_sentinel_metadata.this : a => {
      id                         = a.id
      name                       = a.name
      threat_analysis_tactics    = a.threat_analysis_tactics
      kind                       = a.kind
      source                     = a.source
      author                     = a.author
      category                   = a.category
      content_id                 = a.content_id
      content_schema_version     = a.content_schema_version
      custom_version             = a.custom_version
      first_publish_date         = a.first_publish_date
      last_publish_date          = a.last_publish_date
      parent_id                  = a.parent_id
      preview_images             = a.preview_images
      preview_images_dark        = a.preview_images_dark
      support                    = a.support
      threat_analysis_techniques = a.threat_analysis_techniques
    }
  }
}

output "threat_intelligence_indicator" {
  value = {
    for a in azurerm_sentinel_threat_intelligence_indicator.this : a => {
      id                             = a.id
      display_name                   = a.display_name
      description                    = a.description
      pattern_type                   = a.pattern_type
      pattern                        = a.pattern
      created_by                     = a.created_by
      created_on                     = a.created_on
      confidence                     = a.confidence
      defanged                       = a.defanged
      extension                      = a.extension
      external_id                    = a.external_id
      external_last_updated_time_utc = a.external_last_updated_time_utc
      external_reference             = a.external_reference
      granular_marking               = a.granular_marking
      kill_chain_phase               = a.kill_chain_phase
      indicator_type                 = a.indicator_type
    }
  }
}

output "watchlist" {
  value = {
    for a in azurerm_sentinel_watchlist.this : a => {
      id               = a.id
      display_name     = a.display_name
      name             = a.name
      default_duration = a.default_duration
      item_search_key  = a.item_search_key
      labels           = a.labels
    }
  }
}

output "watchlist_item" {
  value = {
    for a in azurerm_sentinel_watchlist_item.this : a => {
      id   = a.id
      name = a.name
    }
  }
}
