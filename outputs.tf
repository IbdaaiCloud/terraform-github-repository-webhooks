#---------------------------------------------------
# Outputs GitHub Repository Webhook
#---------------------------------------------------

# https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_webhook#attributes-reference

output "repository_webhook_url" {
  description = <<EOF
  URL of the webhook. This is a sensitive attribute because it may include basic auth credentials.
EOF
  value       = try(element(concat(github_repository_webhook.this.*.url, [""]), 0), "")
}
