terraform {
  required_version = ">= 0.13.0"

  required_providers {
    github = {
      source  = "hashicorp/github"
      version = ">= 6.4.0"
    }
  }
}
