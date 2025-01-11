module "wrapper" {
  source = "../"

  for_each = var.items

  repository_webhook_enabled          = try(each.value.repository_webhook_enabled, var.defaults.repository_webhook_enabled, null)
  repository_workflow_repository_name = try(each.value.repository_workflow_repository_name, var.defaults.repository_workflow_repository_name, null)
  repository_webhook_events           = try(each.value.repository_webhook_events, var.defaults.repository_webhook_events, null)
  repository_webhook_active           = try(each.value.repository_webhook_active, var.defaults.repository_webhook_active, null)
  repository_webhook_configuration    = try(each.value.repository_webhook_configuration, var.defaults.repository_webhook_configuration, null)
}
