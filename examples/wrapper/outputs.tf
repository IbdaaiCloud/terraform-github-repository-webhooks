#---------------------------------------------------
# Outputs GitHub Repository Webhook
#---------------------------------------------------

output "github_repository_webhook_wrapper" {
  description = <<EOF
  URL of the webhook. This is a sensitive attribute because it may include basic auth credentials.
EOF
  value       = try(module.github_repository_webhook_wrapper.wrapper, "")
}
