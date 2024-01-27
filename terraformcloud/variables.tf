variable "region" {
  type    = string
  default = "ap-northeast-1"
}

variable "tfc_hostname" {
  type    = string
  default = "app.terraform.io"
}

variable "tfc_aws_audience" {
  type     = string
  default  = "aws.workload.identity"
}

variable "tfc_organization_name" {
  type     = string
  nullable = false
}

variable "tfc_project_name" {
  type     = string
  nullable = false
}

variable "tfc_workspace_name" {
  type     = string
  nullable = false
}