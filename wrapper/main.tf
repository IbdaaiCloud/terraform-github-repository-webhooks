module "wrapper" {
  source = "../"

  for_each = var.items

  enable_repository_webhook_creation  = try(each.value.enable_repository_webhook_creation, var.defaults.enable_repository_webhook_creation, null)
  repository_workflow_repository_name = try(each.value.repository_workflow_repository_name, var.defaults.repository_workflow_repository_name, null)
  repository_webhook_events           = try(each.value.repository_webhook_events, var.defaults.repository_webhook_events, null)
  repository_webhook_active           = try(each.value.repository_webhook_active, var.defaults.repository_webhook_active, null)
  repository_webhook_configuration    = try(each.value.repository_webhook_configuration, var.defaults.repository_webhook_configuration, null)
}
