data "tls_certificate" "tfc_certificate" {
  url = "https://${var.tfc_hostname}"
}

resource "aws_iam_openid_connect_provider" "tfc_provider" {
  url             = data.tls_certificate.tfc_certificate.url
  client_id_list  = [var.tfc_aws_audience]
  thumbprint_list = [data.tls_certificate.tfc_certificate.certificates[0].sha1_fingerprint]
}

data "aws_iam_policy_document" "assume_role_policy_document" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRoleWithWebIdentity"
    ]

    principals {
      type        = "Federated"
      identifiers = [
        aws_iam_openid_connect_provider.tfc_provider.arn
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "${var.tfc_hostname}:aud"
      values   = [
        one(aws_iam_openid_connect_provider.tfc_provider.client_id_list)
      ]
    }

    condition {
      test     = "StringLike"
      variable = "${var.tfc_hostname}:sub"
      values   = [
        "organization:${var.tfc_organization_name}:project:${var.tfc_project_name}:workspace:${var.tfc_workspace_name}:run_phase:*"
      ]
    }
  }
}

resource "aws_iam_role" "terraform_cloud_execution_role" {
  name = "TerraformCloudExecutionRole_${var.tfc_organization_name}_${var.tfc_project_name}_${var.tfc_workspace_name}"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy_document.json
}