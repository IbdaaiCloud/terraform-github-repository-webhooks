<div align="center">
  <img src="https://raw.githubusercontent.com/IbdaaiCloud/terraform-github-repository-webhooks/refs/heads/main/.github/assets/img/banner.svg" alt="IbdaaiCloud - Terraform GitHub Repository Webhooks" />
</div>

<div align="center">
  <a href="https://github.com/IbdaaiCloud/terraform-github-repository-webhooks">
    <img src="https://img.shields.io/badge/github-%23181717.svg?style=for-the-badge&logo=github&logoColor=white" alt="GitHub"/>
  </a>
  <a href="https://registry.terraform.io/modules/IbdaaiCloud/repository-webhooks/github/latest">
    <img src="https://img.shields.io/github/v/release/IbdaaiCloud/terraform-github-repository-webhooks?color=blue&label=terraform&logo=terraform&style=for-the-badge" alt="Terraform Registry"/>
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

## Description

This repository contains Terraform modules for managing GitHub repository webhooks. The module allows you to create, update, and delete GitHub repository webhooks.

## Usage

### Module

The following example demonstrates how to use the module to create a GitHub repository webhook.

```hcl
module "repository_webhooks" {
  source  = "IbdaaiCloud/repository-webhooks/github"
  # version = "x.x.x"

  repository_workflow_repository_name = "IbdaaiCloud/terraform-github-repository-webhooks"
  repository_webhook_enabled          = true
  repository_webhook_active           = true
  repository_webhook_events           = ["push"]
  repository_webhook_configuration    = [
    {
      url          = "https://example.com/webhook"
      content_type = "json"
      secret       = "supersecret"
      insecure_ssl = false
    }
  ]
}
```

> [!WARNING]  
> The `version` argument is omitted in the example's `source` block. It is strongly recommended to specify a version to ensure stability and avoid unexpected changes due to future updates. Use a version constraint like `version = "~> x.x.x"` in your project to lock the module to a compatible release.

### Wrapper Module

The wrapper module provided here offers a convenient solution for managing multiple instances of the repository webhook module in scenarios where the native `for_each` feature introduced in `Terraform 0.13+` cannot be utilized, such as when working with Terragrunt.

This approach allows you to consolidate configurations into a single Terragrunt file, effectively managing multiple resources without duplicating `terragrunt.hcl` files for each instance of the module.

The wrapper is designed purely as a utility for orchestrating multiple modules and does not add any extra functionality beyond simplifying the configuration process.

#### Example Usage with Terraform

```hcl
module "repository_webhook_wrapper" {
  source = "IbdaaiCloud/repository-webhooks/github//wrapper"
  # version = "x.x.x"

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
    "repository-example-1" = {
      # omitted... can be any arguments supported by the module
    }
    "repository-example-2" = {
      # omitted... can be any arguments supported by the module
    }
    "repository-example-3" = {
      # omitted... can be any arguments supported by the module
    }
  }
}
```

#### Example Usage with Terragrunt

```hcl
terraform {
  source = "IbdaaiCloud/repository-webhooks/github//wrapper"
  # version = "x.x.x"
}

inputs = {
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
    "repository-example-1" = {
      # omitted... can be any arguments supported by the module
    }
    "repository-example-2" = {
      # omitted... can be any arguments supported by the module
    }
    "repository-example-3" = {
      # omitted... can be any arguments supported by the module
    }
  }
}
```

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                                     | Version   |
| ------------------------------------------------------------------------ | --------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 0.13.0 |
| <a name="requirement_github"></a> [github](#requirement_github)          | >= 6.4.0  |

## Providers

| Name                                                      | Version  |
| --------------------------------------------------------- | -------- |
| <a name="provider_github"></a> [github](#provider_github) | >= 6.4.0 |

## Modules

No modules.

## Resources

| Name                                                                                                                                | Type     |
| ----------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [github_repository_webhook.this](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/repository_webhook) | resource |

## Inputs

| Name                                                                                                                                       | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                   | Type                                                                                                                         | Default | Required |
| ------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- | ------- | :------: |
| <a name="input_repository_webhook_active"></a> [repository_webhook_active](#input_repository_webhook_active)                               | (Optional) Indicate if the webhook should receive events. Defaults to true.                                                                                                                                                                                                                                                                                                                                                                                   | `bool`                                                                                                                       | `true`  |    no    |
| <a name="input_repository_webhook_configuration"></a> [repository_webhook_configuration](#input_repository_webhook_configuration)          | (Required) Configuration block for the webhook.<br/><br/> configuration:<br/> url - (Required) The URL of the webhook.<br/> content_type - (Required) The content type for the payload. Valid values are either form or json.<br/> secret - (Optional) The shared secret for the webhook. [See API documentation](https://developer.github.com/v3/repos/hooks/#create-a-hook).<br/> insecure_ssl - (Optional) Insecure SSL boolean toggle. Defaults to false. | <pre>list(object({<br/> url = string<br/> content_type = string<br/> secret = string<br/> insecure_ssl = bool<br/> }))</pre> | n/a     |   yes    |
| <a name="input_repository_webhook_enabled"></a> [repository_webhook_enabled](#input_repository_webhook_enabled)                            | (Required) Whether the webhook should be enabled. Defaults to false. If set to true, the webhook will be created.                                                                                                                                                                                                                                                                                                                                             | `bool`                                                                                                                       | `false` |    no    |
| <a name="input_repository_webhook_events"></a> [repository_webhook_events](#input_repository_webhook_events)                               | (Required) A list of events which should trigger the webhook. See a list of [available events](https://developer.github.com/v3/activity/events/types/).                                                                                                                                                                                                                                                                                                       | `list(string)`                                                                                                               | n/a     |   yes    |
| <a name="input_repository_workflow_repository_name"></a> [repository_workflow_repository_name](#input_repository_workflow_repository_name) | (Required) The repository of the webhook. This is the name of the repository, not the full URL.                                                                                                                                                                                                                                                                                                                                                               | `string`                                                                                                                     | n/a     |   yes    |

## Outputs

| Name                                                                                                  | Description                                                                                      |
| ----------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ |
| <a name="output_repository_webhook_url"></a> [repository_webhook_url](#output_repository_webhook_url) | URL of the webhook. This is a sensitive attribute because it may include basic auth credentials. |

<!-- END_TF_DOCS -->

## License

This work is licensed under MIT License. See [LICENSE](LICENSE) for full details.

## Authors

This module is maintained by the IbdaaiCloud team.
