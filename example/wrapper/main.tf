#---------------------------------------------------
# GitHub Repository Webhook Module
#---------------------------------------------------
module "github_repository_webhook_wrapper" {
  source  = "IbdaaiCloud/repository-webhooks/github//wrapper"
  version = "1.0.2"

  defaults = {
    repository_webhook_enabled = true
    repository_webhook_configuration = [{
      url          = "https://example.com"
      content_type = "json"
      secret       = local.github_token
      insecure_ssl = true
    }]
  }

  items = {
    "terraform-github-repository-webhooks" = {
      repository_workflow_repository_name = "terraform-github-repository-webhooks"
      repository_webhook_events           = ["push"]
      repository_webhook_active           = true
    }
  }
}
