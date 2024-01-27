variable "region" {
  default = "ap-northeast-1"
}

variable "tfc_hostname" {
  nullable = false
}

variable "tfc_aws_audience" {
  nullable = false
}

variable "tfc_organization_name" {
  nullable = false
}

variable "tfc_project_name" {
  nullable = false
}

variable "tfc_workspace_name" {
  nullable = false
}