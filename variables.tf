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

## SENTINEL

variable "sentinel_onboarding" {
  type = list(object({
    id                           = string
    workspace_id                 = string
    customer_managed_key_enabled = optional(bool)
  }))
  default = []
}

variable "machine_learning_behavior_analytics" {
  type = list(object({
    id                       = string
    alert_rule_template_guid = string
    workspace_id             = string
    name                     = string
    enabled                  = optional(bool)
  }))
  default = []
}

variable "alert_rule_anomaly" {
  type = list(object({
    id           = string
    enabled      = bool
    workspace_id = string
    mode         = string
    name         = optional(string)
    display_name = optional(string)
  }))
  default = []

  validation {
    condition     = alltrue([for rule in var.alert_rule_anomaly : true if contains(["Production", "Flighting"], rule.mode)])
    error_message = "Mode of the Built-in Anomaly Alert Rule. Possible Values are Production and Flighting."
  }
}

variable "alert_rule_anomaly_duplicate" {
  type = list(object({
    id               = string
    built_in_rule_id = string
    display_name     = string
    enabled          = bool
    workspace_id     = string
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

  validation {
    condition     = alltrue([for rule in var.alert_rule_anomaly_duplicate : true if contains(["Production", "Flighting"], rule.mode)])
    error_message = "Mode of the Built-in Anomaly Alert Rule. Possible Values are Production and Flighting."
  }
}

variable "alert_rule_fusion" {
  type = list(object({
    id           = string
    workspace_id = string
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
    id                          = string
    display_name                = string
    workspace_id                = string
    name                        = string
    product_filter              = string
    severity_filter             = list(string)
    description                 = optional(string)
    enabled                     = optional(bool)
    display_name_filter         = optional(list(string))
    display_name_exclude_filter = optional(list(string))
  }))
  default = []

  validation {
    condition     = alltrue([for incident in var.ms_security_incident : true if contains(["High", "Medium", "Low", "Informational"], incident.severity_filter)])
    error_message = "Only create incidents from alerts when alert severity level is contained in this list. Possible values are High, Medium, Low and Informational."
  }

  validation {
    condition     = alltrue([for incident in var.ms_security_incident : true if contains(["Azure Active Directory Identity Protection", "Azure Advanced Threat Protection", "Azure Security Center", "Azure Security Center for IoT", "Microsoft Cloud App Security", "Microsoft Defender Advanced Threat Protection", "Office 365 Advanced Threat Protection"], incident.product_filter)])
    error_message = "The Microsoft Security Service from where the alert will be generated. Possible values are Azure Active Directory Identity Protection, Azure Advanced Threat Protection, Azure Security Center, Azure Security Center for IoT, Microsoft Cloud App Security, Microsoft Defender Advanced Threat Protection and Office 365 Advanced Threat Protection."
  }
}

variable "alert_rule_nrt" {
  type = list(object({
    id                                  = string
    display_name                        = string
    workspace_id                        = string
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

  validation {
    condition     = alltrue([for rule in var.alert_rule_nrt : true if contains(["High", "Medium", "Low", "Informational"], rule.severity)])
    error_message = "The alert severity of this Sentinel NRT Alert Rule. Possible values are High, Medium, Low and Informational."
  }

  validation {
    condition     = alltrue([for rule in var.alert_rule_nrt : true if contains(["Collection", "CommandAndControl", "CredentialAccess", "DefenseEvasion", "Discovery", "Execution", "Exfiltration", "Impact", "ImpairProcessControl", "InhibitResponseFunction", "InitialAccess", "LateralMovement", "Persistence", "PreAttack", "PrivilegeEscalation", "Reconnaissance", "ResourceDevelopment"], rule.tactics)])
    error_message = "A list of categories of attacks by which to classify the rule. Possible values are Collection, CommandAndControl, CredentialAccess, DefenseEvasion, Discovery, Execution, Exfiltration, Impact, ImpairProcessControl, InhibitResponseFunction, InitialAccess, LateralMovement, Persistence, PreAttack, PrivilegeEscalation, Reconnaissance and ResourceDevelopment."
  }
}

variable "alert_rule_scheduled" {
  type = list(object({
    id                                  = string
    display_name                        = string
    workspace_id                        = string
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
    trigger_operator                    = optional(string)
    trigger_threshold                   = optional(number)
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

  validation {
    condition     = alltrue([for incident in var.alert_rule_scheduled : true if contains(["High", "Medium", "Low", "Informational"], incident.severity)])
    error_message = "Only create incidents from alerts when alert severity level is contained in this list. Possible values are High, Medium, Low and Informational."
  }

  validation {
    condition     = alltrue([for rule in var.alert_rule_scheduled : true if contains(["Collection", "CommandAndControl", "CredentialAccess", "DefenseEvasion", "Discovery", "Execution", "Exfiltration", "Impact", "ImpairProcessControl", "InhibitResponseFunction", "InitialAccess", "LateralMovement", "Persistence", "PreAttack", "PrivilegeEscalation", "Reconnaissance", "ResourceDevelopment"], rule.tactics)])
    error_message = "A list of categories of attacks by which to classify the rule. Possible values are Collection, CommandAndControl, CredentialAccess, DefenseEvasion, Discovery, Execution, Exfiltration, Impact, ImpairProcessControl, InhibitResponseFunction, InitialAccess, LateralMovement, Persistence, PreAttack, PrivilegeEscalation, Reconnaissance and ResourceDevelopment."
  }

  validation {
    condition     = alltrue([for rule in var.alert_rule_scheduled : true if contains(["Equal", "GreaterThan", "LessThan", "NotEqual"], rule.trigger_operator)])
    error_message = "The alert trigger operator, combined with trigger_threshold, setting alert threshold of this Sentinel Scheduled Alert Rule. Possible values are Equal, GreaterThan, LessThan, NotEqual. Defaults to GreaterThan."
  }
}

variable "alert_rule_threat_intelligence" {
  type = list(object({
    id                       = string
    workspace_id             = string
    alert_rule_template_guid = any
    name                     = string
    enabled                  = optional(bool)
  }))
  default = []
}

variable "automation_rule" {
  type = list(object({
    id             = string
    display_name   = string
    workspace_id   = string
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

  validation {
    condition     = alltrue([for rule in var.automation_rule : true if rule.order >= 1 && rule.order <= 1000])
    error_message = "The order of this Sentinel Automation Rule. Possible values varies between 1 and 1000."
  }
}

variable "data_connector_cloud_trail" {
  type = list(object({
    id           = string
    aws_role_arn = string
    workspace_id = string
    name         = string
  }))
  default = []
}

variable "data_connector_s3" {
  type = list(object({
    id                = string
    aws_role_arn      = string
    destination_table = string
    workspace_id      = string
    name              = string
    sqs_urls          = list(string)
  }))
  default = []
}

variable "data_connect_aad" {
  type = list(object({
    id           = string
    workspace_id = string
    name         = string
  }))
  default = []
}

variable "data_connector_azure_security_center" {
  type = list(object({
    id           = string
    workspace_id = string
    name         = string
  }))
  default = []
}

variable "data_connector_iot" {
  type = list(object({
    id           = string
    workspace_id = string
    name         = string
  }))
  default = []
}

variable "data_connector_cloud_app_security" {
  type = list(object({
    id                     = string
    workspace_id           = string
    name                   = string
    alerts_enabled         = optional(bool)
    discovery_logs_enabled = optional(bool)
  }))
  default = []
}

variable "data_connector_dynamics_365" {
  type = list(object({
    id           = string
    workspace_id = string
    name         = string
  }))
  default = []
}

variable "data_connector_defender_advanced_threat_protection" {
  type = list(object({
    id           = string
    workspace_id = string
    name         = string
  }))
  default = []
}

variable "data_connector_azure_advanced_threat_protection" {
  type = list(object({
    id           = string
    workspace_id = string
    name         = string
  }))
  default = []
}

variable "data_connector_azure_advanced_threat_intelligence" {
  type = list(object({
    id                                           = string
    workspace_id                                 = string
    name                                         = string
    microsoft_emerging_threat_feed_lookback_date = optional(string)
  }))
  default = []
}

variable "data_connector_microsoft_threat_protection" {
  type = list(object({
    id           = string
    workspace_id = string
    name         = string
  }))
  default = []
}

variable "data_connector_office_365" {
  type = list(object({
    id                 = string
    workspace_id       = string
    name               = string
    teams_enabled      = optional(bool)
    sharepoint_enabled = optional(bool)
    exchange_enabled   = optional(bool)
  }))
  default = []
}

variable "data_connector_office_365_project" {
  type = list(object({
    id           = string
    workspace_id = string
    name         = string
  }))
  default = []
}

variable "data_connector_office_atp" {
  type = list(object({
    id           = string
    workspace_id = string
    name         = string
  }))
  default = []
}

variable "data_connector_office_irm" {
  type = list(object({
    id           = string
    workspace_id = string
    name         = string
  }))
  default = []
}

variable "data_connector_office_power_bi" {
  type = list(object({
    id           = string
    workspace_id = string
    name         = string
  }))
  default = []
}

variable "data_connector_threat_intelligence_taxii" {
  type = list(object({
    id                = string
    workspace_id      = string
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

  validation {
    condition     = alltrue([for taxii in var.data_connector_threat_intelligence_taxii : true if contains(["OnceAMinute", "OnceAnHour", "OnceADay"], taxii.polling_frequency)])
    error_message = "The polling frequency for the TAXII server. Possible values are OnceAMinute, OnceAnHour and OnceADay. Defaults to OnceAnHour."
  }
}

variable "sentinel_metadata" {
  type = list(object({
    id                         = string
    alert_id                   = string
    kind                       = string
    name                       = string
    workspace_id               = string
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

  validation {
    condition     = alltrue([for metadata in var.sentinel_metadata : true if contains(["AnalyticsRule", "AnalyticsRuleTemplate", "AutomationRule", "AzureFunction", "DataConnector", "DataType", "HuntingQuery", "InvestigationQuery", "LogicAppsCustomConnector", "Parser", "Playbook", "PlaybookTemplate", "Solution", "Watchlist", "WatchlistTemplate", "Workbook", "WorkbookTemplate"], metadata.kind)])
    error_message = "The kind of content the metadata is for. Possible values are AnalyticsRule, AnalyticsRuleTemplate, AutomationRule, AzureFunction, DataConnector, DataType, HuntingQuery, InvestigationQuery, LogicAppsCustomConnector, Parser, Playbook, PlaybookTemplate, Solution, Watchlist, WatchlistTemplate, Workbook and WorkbookTemplate."
  }

  validation {
    condition     = alltrue([for metadata in var.sentinel_metadata : true if contains(["Reconnaissance", "ResourceDevelopment", "InitialAccess", "Execution", "Persistence", "PrivilegeEscalation", "DefenseEvasion", "CredentialAccess", "Discovery", "LateralMovement", "Collection", "CommandAndControl", "Exfiltration", "Impact", "ImpairProcessControl", "InhibitResponseFunction"], metadata.threat_analysis_tactics)])
    error_message = "Specifies a list of tactics the resource covers. Possible values are Reconnaissance, ResourceDevelopment, InitialAccess, Execution, Persistence, PrivilegeEscalation, DefenseEvasion, CredentialAccess, Discovery, LateralMovement, Collection, CommandAndControl, Exfiltration, Impact, ImpairProcessControl and InhibitResponseFunction."
  }
}

variable "threat_intelligence_indicator" {
  type = list(object({
    id                    = string
    display_name          = string
    pattern               = string
    pattern_type          = string
    source                = string
    validate_from_utc     = string
    workspace_id          = string
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

  validation {
    condition     = alltrue([for indicator in var.threat_intelligence_indicator : true if contains(["domain-name", "file", "ipv4-addr", "ipv6-addr", "url"], indicator.pattern_type)])
    error_message = "The type of pattern used by the Threat Intelligence Indicator. Possible values are domain-name, file, ipv4-addr, ipv6-addr and url."
  }
}

variable "sentinel_watchlist" {
  type = list(object({
    id               = string
    display_name     = string
    item_search_key  = string
    workspace_id     = string
    name             = string
    default_duration = optional(string)
    description      = optional(string)
    labels           = optional(list(string))
  }))
  default = []
}

variable "watchlist_items" {
  type = list(object({
    id           = string
    properties   = map(string)
    watchlist_id = string
    name         = optional(string)
  }))
  default = []
}