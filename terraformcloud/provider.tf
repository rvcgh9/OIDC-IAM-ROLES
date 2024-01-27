terraform {
  required_version = "= 1.7.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.34.0"
    }
  }

  backend "s3" {
    bucket = "[replace here when you use]"
    key    = "oidc-iam-roles/terraform.tfstate"
  }
}

provider "aws" {
  region = var.region
}