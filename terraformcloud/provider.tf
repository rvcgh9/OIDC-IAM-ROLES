terraform {
  required_version = "= 1.7.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= v5.34.0"
    }
  }

  backend "s3" {
    bucket = var.backend_bucket_name
    key    = "/oidc-iam-roles/${var.tfc_hostname}/${var.tfc_organization_name}/${var.tfc_project_name}/${var.tfc_workspace_name}"
  }
}

provider "aws" {
  region = var.region
}