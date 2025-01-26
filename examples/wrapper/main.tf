#---------------------------------------------------
# GitHub Repository Webhook Module
#---------------------------------------------------
module "github_repository_webhook_wrapper" {
  source = "IbdaaiCloud/repository-webhooks/github//wrapper"

  defaults = {
    enable_repository_webhook_creation = true
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
