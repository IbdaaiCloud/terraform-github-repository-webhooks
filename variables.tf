#---------------------------------------------------
# Variables Environment
#---------------------------------------------------

variable "repository_webhook_enabled" {
  type        = bool
  description = <<EOF
  (Required) Whether the webhook should be enabled. Defaults to false. If set to true, the webhook will be created.
EOF
  default     = false
}

#---------------------------------------------------
# Variables GitHub Repository Webhook
#---------------------------------------------------

# https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_webhook#argument-reference

variable "repository_workflow_repository_name" {
  type        = string
  description = <<EOF
  (Required) The repository of the webhook. This is the name of the repository, not the full URL.
EOF
}

variable "repository_webhook_events" {
  type        = list(string)
  description = <<EOF
  (Required) A list of events which should trigger the webhook. See a list of [available events](https://developer.github.com/v3/activity/events/types/).
EOF
}

variable "repository_webhook_active" {
  type        = bool
  description = <<EOF
  (Optional) Indicate if the webhook should receive events. Defaults to true.
EOF
  default     = true
}

variable "repository_webhook_configuration" {
  type = list(object({
    url          = string
    content_type = string
    secret       = string
    insecure_ssl = bool
  }))
  description = <<EOF
  (Required) Configuration block for the webhook.

  configuration:
    url          - (Required) The URL of the webhook.
    content_type - (Required) The content type for the payload. Valid values are either form or json.
    secret       - (Optional) The shared secret for the webhook. [See API documentation](https://developer.github.com/v3/repos/hooks/#create-a-hook).
    insecure_ssl - (Optional) Insecure SSL boolean toggle. Defaults to false.
EOF
}
