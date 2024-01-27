terraform {
  required_version = "= 1.7.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= v5.34.0"
    }
  }
}

provider "aws" {
  region = var.region
}