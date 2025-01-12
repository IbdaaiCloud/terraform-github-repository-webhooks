#---------------------------------------------------
# GitHub Repository Webhook Module
#---------------------------------------------------
module "github_repository_webhook" {
  source  = "IbdaaiCloud/repository-webhooks/github"
  version = "1.0.6"

  repository_webhook_enabled          = true
  repository_workflow_repository_name = "terraform-github-repository-webhooks"
  repository_webhook_events           = ["push"]
  repository_webhook_active           = true
  repository_webhook_configuration = [{
    url          = "https://example.com"
    content_type = "json"
    secret       = local.github_token
    insecure_ssl = true
  }]
}
