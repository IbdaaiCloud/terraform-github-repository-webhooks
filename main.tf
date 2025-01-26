#---------------------------------------------------
# GitHub Repository Webhook
#---------------------------------------------------

# https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_webhook

resource "github_repository_webhook" "this" {
  count = var.enable_repository_webhook_creation ? 1 : 0

  repository = var.repository_workflow_repository_name
  events     = var.repository_webhook_events
  active     = var.repository_webhook_active

  dynamic "configuration" {
    iterator = configuration
    for_each = can(length(var.repository_webhook_configuration)) ? var.repository_webhook_configuration : []

    content {
      url          = lookup(configuration.value, "url", null)
      content_type = lookup(configuration.value, "content_type", null)
      secret       = lookup(configuration.value, "secret", null)
      insecure_ssl = lookup(configuration.value, "insecure_ssl", null)
    }
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      configuration,
    ]
  }
}
