<div align="center">
  <img src="./.github/assets/img/header.svg" alt="IbdaaiCloud" />
</div>

<div align="center">
  <a href="https://github.com/IbdaaiCloud/terraform-github-repository-webhooks">
    <img src="https://img.shields.io/badge/github-%23181717.svg?style=for-the-badge&logo=github&logoColor=white" alt="GitHub"/>
  </a>
  <a href="https://github.com/IbdaaiCloud/terraform-github-repository-webhooks/releases">
    <img src="https://img.shields.io/github/v/release/IbdaaiCloud/terraform-github-repository-webhooks?include_prereleases&sort=date&style=for-the-badge" alt="GitHub Releases"/>
  </a>
  <a href="https://github.com/IbdaaiCloud/terraform-github-repository-webhooks/stargazers">
    <img src="https://img.shields.io/github/stars/IbdaaiCloud/terraform-github-repository-webhooks.svg?style=for-the-badge" alt="GitHub Stars"/>
  </a>
  <a href="https://github.com/IbdaaiCloud/terraform-github-repository-webhooks/forks">
    <img src="https://img.shields.io/github/forks/IbdaaiCloud/terraform-github-repository-webhooks.svg?style=for-the-badge" alt="GitHub Forks"/>
  </a>
  <a href="https://github.com/IbdaaiCloud/terraform-github-repository-webhooks/issues">
    <img src="https://img.shields.io/github/issues/IbdaaiCloud/terraform-github-repository-webhooks.svg?style=for-the-badge" alt="GitHub Issues"/>
  </a>
  <a href="LICENSE">
    <img src="https://img.shields.io/github/license/IbdaaiCloud/terraform-github-repository-webhooks.svg?style=for-the-badge" alt="GitHub License"/>
  </a>
</div>

# Terraform GitHub Repository Webhooks

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | >= 6.4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | >= 6.4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_repository_webhook.this](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/repository_webhook) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_repository_webhook_active"></a> [repository\_webhook\_active](#input\_repository\_webhook\_active) | (Optional) Indicate if the webhook should receive events. Defaults to true. | `bool` | `true` | no |
| <a name="input_repository_webhook_configuration"></a> [repository\_webhook\_configuration](#input\_repository\_webhook\_configuration) | (Required) Configuration block for the webhook.<br/><br/>  configuration:<br/>    url          - (Required) The URL of the webhook.<br/>    content\_type - (Required) The content type for the payload. Valid values are either form or json.<br/>    secret       - (Optional) The shared secret for the webhook. [See API documentation](https://developer.github.com/v3/repos/hooks/#create-a-hook).<br/>    insecure\_ssl - (Optional) Insecure SSL boolean toggle. Defaults to false. | <pre>list(object({<br/>    url          = string<br/>    content_type = string<br/>    secret       = string<br/>    insecure_ssl = bool<br/>  }))</pre> | n/a | yes |
| <a name="input_repository_webhook_enabled"></a> [repository\_webhook\_enabled](#input\_repository\_webhook\_enabled) | (Required) Whether the webhook should be enabled. Defaults to false. If set to true, the webhook will be created. | `bool` | `false` | no |
| <a name="input_repository_webhook_events"></a> [repository\_webhook\_events](#input\_repository\_webhook\_events) | (Required) A list of events which should trigger the webhook. See a list of [available events](https://developer.github.com/v3/activity/events/types/). | `list(string)` | n/a | yes |
| <a name="input_repository_workflow_repository_name"></a> [repository\_workflow\_repository\_name](#input\_repository\_workflow\_repository\_name) | (Required) The repository of the webhook. This is the name of the repository, not the full URL. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_repository_webhook_url"></a> [repository\_webhook\_url](#output\_repository\_webhook\_url) | URL of the webhook. This is a sensitive attribute because it may include basic auth credentials. |
<!-- END_TF_DOCS -->
