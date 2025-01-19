<div align="center">
  <img src="https://raw.githubusercontent.com/IbdaaiCloud/terraform-github-repository-webhooks/refs/heads/main/.github/assets/img/banner.svg" alt="IbdaaiCloud - Terraform GitHub Repository Webhooks Wrapper"/>
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

# Terraform GitHub Repository Webhooks Wrapper

This module creates a wrapper around the `github_repository_webhook` resource to allow for multiple webhooks to be created at once.

## Usage

The wrapper module provided here offers a convenient solution for managing multiple instances of the repository webhook module in scenarios where the native `for_each` feature introduced in `Terraform 0.13+` cannot be utilized, such as when working with Terragrunt.

This approach allows you to consolidate configurations into a single Terragrunt file, effectively managing multiple resources without duplicating `terragrunt.hcl` files for each instance of the module.

The wrapper is designed purely as a utility for orchestrating multiple modules and does not add any extra functionality beyond simplifying the configuration process.

### Example Usage with Terraform

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

### Example Usage with Terragrunt

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

> [!WARNING]  
> The `version` argument is omitted in the example's `source` block. It is strongly recommended to specify a version to ensure stability and avoid unexpected changes due to future updates. Use a version constraint like `version = "~> x.x.x"` in your project to lock the module to a compatible release.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | >= 6.4.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_wrapper"></a> [wrapper](#module\_wrapper) | ../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_defaults"></a> [defaults](#input\_defaults) | Map of default values which will be used for each item. | `any` | `{}` | no |
| <a name="input_items"></a> [items](#input\_items) | Maps of items to create a wrapper from. Values are passed through to the module. | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_wrapper"></a> [wrapper](#output\_wrapper) | Map of outputs of a wrapper. |
<!-- END_TF_DOCS -->
