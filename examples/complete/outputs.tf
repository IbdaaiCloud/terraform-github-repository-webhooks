#---------------------------------------------------
# Outputs GitHub Repository Webhook
#---------------------------------------------------

output "repository_webhook_url" {
  description = <<EOF
  URL of the webhook. This is a sensitive attribute because it may include basic auth credentials.
EOF
  value       = try(module.github_repository_webhook.repository_webhook_url, "")
}
