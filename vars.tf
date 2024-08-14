## DATASOURCE

variable "resource_group_name" {
  type    = string
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "logic_app_standard_name" {
  type    = string
  default = null
}

variable "logic_app_workflow_name" {
  type    = string
  default = null
}

variable "subscription_id" {
  type    = string
  default = null
}

variable "azurerm_log_analytics_workspace_name" {
  type    = string
  default = null
}

variable "azurerm_sentinel_alert_rule_anomaly_name" {
  type    = string
  default = null
}

variable "azurerm_sentinel_alert_rule_name" {
  type    = string
  default = null
}

variable "azurerm_sentinel_alert_rule_template_name" {
  type    = string
  default = null
}

## LOG ANALYTICS

variable "workspace" {
  type        = any
  default     = []
  description = <<EOF
workspace = [{
    id                                 = number
    name                               = string
    allow_resource_only_permissions    = optional(bool)
    local_authentication_disabled      = optional(bool)
    sku                                = optional(string)
    retention_in_days                  = optional(number)
    daily_quota_gb                     = optional(number)
    cmk_for_query_forced               = optional(bool)
    internet_ingestion_enabled         = optional(bool)
    internet_query_enabled             = optional(bool)
    reservation_capacity_in_gb_per_day = optional(number)
    tags                               = optional(map(string))
}]
EOF
}

variable "solution" {
  type        = any
  default     = []
  description = <<EOF
solution = [{
    id            = number
    solution_name = string
    workspace_id  = any
    tags          = optional(map(string))
    plan = list(object({
      product        = string
      publisher      = string
      promotion_code = optional(string)
    }))
}]
EOF
}

## SENTINEL

variable "sentinel_onboarding" {
  type = list(object({
    id                           = number
    workspace_id                 = any
    customer_managed_key_enabled = optional(bool)
  }))
  default = []
}

variable "machine_learning_behavior_analytics" {
  type = list(object({
    id                       = number
    alert_rule_template_guid = string
    workspace_id             = any
    name                     = string
    enabled                  = optional(bool)
  }))
  default = []
}

variable "alert_rule_anomaly" {
  type = list(object({
    id           = number
    enabled      = bool
    workspace_id = any
    mode         = string
    name         = optional(string)
    display_name = optional(string)
  }))
  default = []
}

variable "alert_rule_anomaly_duplicate" {
  type = list(object({
    id               = number
    built_in_rule_id = any
    display_name     = string
    enabled          = bool
    workspace_id     = any
    mode             = string
    multi_select_observation = optional(list(object({
      name   = string
      values = list(string)
    })), [])
    prioritized_exclude_observation = optional(list(object({
      name       = string
      exclude    = optional(string)
      prioritize = optional(string)
    })), [])
    single_select_observation = optional(list(object({
      name  = string
      value = string
    })), [])
    threshold_observation = optional(list(object({
      name  = string
      value = string
    })), [])
  }))
  default = []
}

variable "alert_rule_fusion" {
  type = list(object({
    id           = number
    workspace_id = any
    name         = string
    enabled      = optional(bool)
    source = optional(list(object({
      name    = string
      enabled = optional(bool)
      sub_type = optional(list(object({
        name               = string
        severities_allowed = list(string)
        enabled            = optional(bool)
      })), [])
    })), [])
  }))
  default = []
}

variable "ms_security_incident" {
  type = list(object({
    id                          = number
    display_name                = string
    workspace_id                = any
    name                        = string
    product_filter              = string
    severity_filter             = list(string)
    description                 = optional(string)
    enabled                     = optional(bool)
    display_name_filter         = optional(list(string))
    display_name_exclude_filter = optional(list(string))
  }))
  default = []
}

variable "alert_rule_nrt" {
  type = list(object({
    id                                  = number
    display_name                        = string
    workspace_id                        = any
    name                                = string
    query                               = string
    severity                            = string
    alert_rule_template_version         = optional(string)
    custom_details                      = optional(map(string))
    description                         = optional(string)
    enabled                             = optional(bool)
    suppression_duration                = optional(string)
    suppression_enabled                 = optional(bool)
    tactics                             = optional(list(string))
    techniques                          = optional(list(string))
    event_grouping_aggregation_method   = optional(string)
    sentinel_entity_mapping_column_name = optional(string)
    alert_details_override = optional(list(object({
      description_format   = optional(string)
      display_name_format  = optional(string)
      severity_column_name = optional(string)
      tactics_column_name  = optional(string)
      dynamic_property = optional(list(object({
        name  = string
        value = string
      })), [])
    })), [])
    entity_mapping = optional(list(object({
      entity_type = string
      field_mapping = optional(list(object({
        column_name = string
        identifier  = string
      })), [])
    })), [])
    incident = optional(list(object({
      create_incident_enabled = bool
      grouping = optional(list(object({
        enabled                 = optional(bool)
        lookback_duration       = optional(string)
        reopen_closed_incidents = optional(bool)
        entity_matching_method  = optional(string)
        by_entities             = optional(set(string))
        by_alert_details        = optional(set(string))
        by_custom_details       = optional(set(string))
      })), [])
    })), [])
  }))
  default = []
}

variable "alert_rule_scheduled" {
  type = list(object({
    id                                  = number
    display_name                        = string
    workspace_id                        = any
    name                                = string
    query                               = string
    severity                            = string
    alert_rule_template_version         = optional(string)
    custom_details                      = optional(map(string))
    description                         = optional(string)
    enabled                             = optional(bool)
    suppression_duration                = optional(string)
    suppression_enabled                 = optional(bool)
    tactics                             = optional(list(string))
    techniques                          = optional(list(string))
    event_grouping_aggregation_method   = optional(string)
    sentinel_entity_mapping_column_name = optional(string)
    alert_details_override = optional(list(object({
      description_format   = optional(string)
      display_name_format  = optional(string)
      severity_column_name = optional(string)
      tactics_column_name  = optional(string)
      dynamic_property = optional(list(object({
        name  = string
        value = string
      })), [])
    })), [])
    entity_mapping = optional(list(object({
      entity_type = string
      field_mapping = optional(list(object({
        column_name = string
        identifier  = string
      })), [])
    })), [])
    incident = optional(list(object({
      create_incident_enabled = bool
      grouping = optional(list(object({
        enabled                 = optional(bool)
        lookback_duration       = optional(string)
        reopen_closed_incidents = optional(bool)
        entity_matching_method  = optional(string)
        by_entities             = optional(set(string))
        by_alert_details        = optional(set(string))
        by_custom_details       = optional(set(string))
      })), [])
    })), [])
  }))
  default = []
}

variable "alert_rule_threat_intelligence" {
  type = list(object({
    id                       = number
    workspace_id             = any
    alert_rule_template_guid = any
    name                     = string
    enabled                  = optional(bool)
  }))
  default = []
}

variable "automation_rule" {
  type = list(object({
    id             = number
    display_name   = string
    workspace_id   = any
    name           = string
    order          = number
    condition_json = optional(string)
    enabled        = optional(bool)
    expiration     = optional(string)
    triggers_on    = optional(string)
    triggers_when  = optional(string)
    action_incident = optional(list(object({
      order                  = number
      status                 = optional(string)
      classification         = optional(string)
      classification_comment = optional(string)
      labels                 = optional(list(string))
      owner_id               = optional(string)
      severity               = optional(string)
    })), [])
    action_playbook = optional(list(object({
      logic_app_id = string
      order        = number
      tenant_id    = optional(string)
    })), [])
  }))
  default = []
}

variable "data_connector_cloud_trail" {
  type = list(object({
    id           = number
    aws_role_arn = string
    workspace_id = any
    name         = string
  }))
  default = []
}

variable "data_connector_s3" {
  type = list(object({
    id                = number
    aws_role_arn      = string
    destination_table = string
    workspace_id      = any
    name              = string
    sqs_urls          = list(string)
  }))
  default = []
}

variable "data_connect_aad" {
  type = list(object({
    id           = number
    workspace_id = any
    name         = string
  }))
  default = []
}

variable "data_connector_azure_security_center" {
  type = list(object({
    id           = number
    workspace_id = any
    name         = string
  }))
  default = []
}

variable "data_connector_iot" {
  type = list(object({
    id           = number
    workspace_id = any
    name         = string
  }))
  default = []
}

variable "data_connector_cloud_app_security" {
  type = list(object({
    id                     = number
    workspace_id           = any
    name                   = string
    alerts_enabled         = optional(bool)
    discovery_logs_enabled = optional(bool)
  }))
  default = []
}

variable "data_connector_dynamics_365" {
  type = list(object({
    id           = number
    workspace_id = any
    name         = string
  }))
  default = []
}

variable "data_connector_defender_advanced_threat_protection" {
  type = list(object({
    id           = number
    workspace_id = any
    name         = string
  }))
  default = []
}

variable "data_connector_azure_advanced_threat_protection" {
  type = list(object({
    id           = number
    workspace_id = any
    name         = string
  }))
  default = []
}

variable "data_connector_azure_advanced_threat_intelligence" {
  type = list(object({
    id                                           = number
    workspace_id                                 = any
    name                                         = string
    microsoft_emerging_threat_feed_lookback_date = optional(string)
  }))
  default = []
}

variable "data_connector_microsoft_threat_protection" {
  type = list(object({
    id           = number
    workspace_id = any
    name         = string
  }))
  default = []
}

variable "data_connector_office_365" {
  type = list(object({
    id                 = number
    workspace_id       = any
    name               = string
    teams_enabled      = optional(bool)
    sharepoint_enabled = optional(bool)
    exchange_enabled   = optional(bool)
  }))
  default = []
}

variable "data_connector_office_365_project" {
  type = list(object({
    id           = number
    workspace_id = any
    name         = string
  }))
  default = []
}

variable "data_connector_office_atp" {
  type = list(object({
    id           = number
    workspace_id = any
    name         = string
  }))
  default = []
}

variable "data_connector_office_irm" {
  type = list(object({
    id           = number
    workspace_id = any
    name         = string
  }))
  default = []
}

variable "data_connector_office_power_bi" {
  type = list(object({
    id           = number
    workspace_id = any
    name         = string
  }))
  default = []
}

variable "data_connector_threat_intelligence_taxii" {
  type = list(object({
    id                = number
    workspace_id      = any
    name              = string
    api_root_url      = string
    collection_id     = string
    display_name      = string
    user_name         = optional(string)
    password          = optional(string)
    polling_frequency = optional(string)
    lookback_date     = optional(string)
  }))
  default = []
}

variable "sentinel_metadata" {
  type = list(object({
    id                         = number
    alert_id                   = any
    kind                       = string
    name                       = string
    workspace_id               = any
    content_schema_version     = optional(string)
    custom_version             = optional(string)
    dependency                 = optional(string)
    first_publish_date         = optional(string)
    icon_id                    = optional(string)
    last_publish_date          = optional(string)
    preview_images             = optional(list(string))
    preview_images_dark        = optional(list(string))
    providers                  = optional(list(string))
    threat_analysis_tactics    = optional(list(string))
    threat_analysis_techniques = optional(list(string))
    source = optional(list(object({
      kind = string
      name = optional(string)
      id   = optional(string)
    })), [])
    support = optional(list(object({
      tier  = string
      email = optional(string)
      link  = optional(string)
      name  = optional(string)
    })), [])
    author = optional(list(object({
      name  = optional(string)
      email = optional(string)
      link  = optional(string)
    })), [])
    category = optional(list(object({
      domains   = optional(list(string))
      verticals = optional(list(string))
    })), [])
  }))
  default = []
}

variable "threat_intelligence_indicator" {
  type = list(object({
    id                    = number
    display_name          = string
    pattern               = string
    pattern_type          = string
    source                = string
    validate_from_utc     = string
    workspace_id          = any
    confidence            = optional(number)
    created_by            = optional(string)
    description           = optional(string)
    extension             = optional(string)
    tags                  = optional(list(string))
    language              = optional(string)
    object_marking_refs   = optional(list(string))
    pattern_version       = optional(string)
    revoked               = optional(bool)
    threat_types          = optional(list(string))
    validate_until_utc    = optional(string)
    kill_chain_phase_name = optional(string)
    external_reference = optional(list(object({
      description = optional(string)
      hashes      = optional(map(string))
      source_name = optional(string)
      url         = optional(string)
    })), [])
    granular_marking = optional(list(object({
      language    = optional(string)
      marking_ref = optional(string)
      selectors   = optional(list(string))
    })), [])
  }))
  default = []
}

variable "sentinel_watchlist" {
  type = list(object({
    id               = number
    display_name     = string
    item_search_key  = string
    workspace_id     = any
    name             = string
    default_duration = optional(string)
    description      = optional(string)
    labels           = optional(list(string))
  }))
  default = []
}

variable "watchlist_items" {
  type = list(object({
    id           = number
    properties   = map(string)
    watchlist_id = any
    name         = optional(string)
  }))
  default = []
}