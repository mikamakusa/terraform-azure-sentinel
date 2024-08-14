run "setup_tests" {
  module {
    source = "./tests/setup"
  }
}

run "sentinel_on_azure_provider_with_data_connector_cloud_trail_and_s3" {

  variables {
    resource_group_name = "rg-test-sentinel-1"
    tags = {
      provider  = "Azure"
      deploy    = "terraform"
    }
    workspace = [
      {
        id                  = 0
        name                = "example-workspace-0"
        sku                 = "PerGB2018"
      },
      {
        id                  = 1
        name                = "example-workspace-1"
        sku                 = "PerGB2018"
      }
    ]
    solution = [
      {
        id                    = 0
        solution_name         = "SecurityInsights-0"
        workspace_id          = 0
        plan = [{
          publisher = "Microsoft"
          product   = "OMSGallery/SecurityInsights"
        }]
      },
      {
        id                    = 1
        solution_name         = "SecurityInsights-1"
        workspace_id          = 1
        plan = [{
          publisher = "Microsoft"
          product   = "OMSGallery/SecurityInsights"
        }]
      }
    ]
    log_analytics_workspace_onboarding = [
      {
        id            = 0
        workspace_id  = 0
      },
      {
        id            = 1
        workspace_id  = 1
      }
    ]
    alert_rule_machine_learning_behavior_analytics = [{
      id                         = 0
      name                       = "example-ml-alert-rule"
      workspace_id               = 0
      alert_rule_template_guid   = "737a2ce1-70a3-4968-9e90-3e6aca836abf"
    }]
    alert_rule_anomaly = [
      {
        id           = 0
        workspace_id = 0
        display_name = "potential data staging"
      },
      {
        id           = 1
        workspace_id = 0
        display_name = "potential data prod"
      },
      {
        id           = 2
        workspace_id = 1
        display_name = "UEBA Anomalous Sign In"
      }
    ]
    alert_rule_anomaly_built_in = [
      {
        id                         = 0
        display_name               = "Potential data staging 0"
        workspace_id               = 0
        mode                       = "Production"
        enabled                    = false
      },
      {
        id                         = 1
        display_name               = "Potential data staging 1"
        workspace_id               = 0
        mode                       = "Production"
        enabled                    = true
      }
    ]
    alert_rule_anomaly_duplicate = [{
      id                         = 0
      display_name               = "example duplicated UEBA Anomalous Sign In"
      workspace_id               = 0
      built_in_rule_id           = 2
      enabled                    = true
      mode                       = "Flighting"
    }]
    alert_rule_fusion = [{
      id                         = 0
      name                       = "example-fusion-alert-rule"
      workspace_id               = 0
      alert_rule_template_guid   = "f71aba3d-28fb-450b-b192-4e76a83015c8"
    }]
    alert_rule_ms_security_incident = [
      {
        id                         = 0
        name                       = "example-ms-security-incident-alert-rule"
        workspace_id               = 0
        product_filter             = "Microsoft Cloud App Security"
        display_name               = "example rule"
        severity_filter            = ["High"]
      },
      {
        id                         = 1
        name                       = "example-ms-security-incident-alert-rule-2"
        workspace_id               = 1
        product_filter             = "Microsoft Cloud App Security"
        display_name               = "example rule"
        severity_filter            = ["High"]
      }
    ]
    alert_rule_nrt = [
      {
        id                         = 0
        name                       = "example"
        workspace_id               = 0
        display_name               = "example"
        severity                   = "High"
        query                      = "AzureActivity | where OperationName == \"Create or Update Virtual Machine\" or OperationName ==\"Create Deployment\" | where ActivityStatus == \"Succeeded\" | make-series dcount(ResourceId) default=0 on EventSubmissionTimestamp in range(ago(7d), now(), 1d) by Caller"
      }
    ]
    alert_rule_scheduled = [
      {
        id                         = 0
        name                       = "example"
        workspace_id               = 0
        display_name               = "example"
        severity                   = "High"
        query                      = "AzureActivity | where OperationName == \"Create or Update Virtual Machine\" or OperationName ==\"Create Deployment\" | where ActivityStatus == \"Succeeded\" | make-series dcount(ResourceId) default=0 on EventSubmissionTimestamp in range(ago(7d), now(), 1d) by Caller"
      }
    ]
    alert_rule_threat_intelligence = [
      {
        id                         = 0
        name                       = "example-rule-0"
        workspace_id               = 0
        alert_rule_template_guid   = 0
      },
      {
        id                         = 1
        name                       = "example-rule-1"
        workspace_id               = 0
        alert_rule_template_guid   = 1
      }
    ]
    automation_rule = [
      {
        id                         = 0
        name                       = "56094f72-ac3f-40e7-a0c0-47bd95f70336"
        workspace_id               = 0
        display_name               = "automation_rule1"
        order                      = 1
        action_incident = [
          {
            order  = 1
            status = "Active"
          }
        ]
      }
    ]
    data_connector_aws_cloud_trail = [
      {
        id           = 0
        name         = "example"
        workspace_id = 0
        aws_role_arn = "arn:aws:iam::000000000000:role/role1"
      }
    ]
    data_connector_aws_s3 = [
      {
        id                         = 0
        name                       = "example"
        workspace_id               = 0
        aws_role_arn               = "arn:aws:iam::000000000000:role/role1"
        destination_table          = "AWSGuardDuty"
        sqs_urls                   = ["https://sqs.us-east-1.amazonaws.com/000000000000/example"]
      }
    ]
    metadata = [{
      id           = 0
      name         = "exampl"
      workspace_id = 0
      alert_id     = 0
      kind         = "AnalyticsRule"
    }]
    threat_intelligence_indicator = [
      {
        id                = 0
        workspace_id      = 0
        pattern_type      = "domain-name"
        pattern           = "http://example.com"
        source            = "Microsoft Sentinel"
        validate_from_utc = "2022-12-14T16:00:00Z"
        display_name      = "example-indicator"
      }
    ]
    watchlist = [{
      id                         = 0
      name                       = "example-watchlist"
      workspace_id               = 0
      display_name               = "example-wl"
      item_search_key            = "Key"
    }]
  }
}