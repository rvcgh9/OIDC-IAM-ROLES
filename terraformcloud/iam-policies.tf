data "aws_iam_policy_document" "network_management_policy_document" {
  statement {
    effect = "Allow"
    actions = [
      "ec2:CreateVpc",
      "ec2:DeleteVpc",

      "ec2:CreateSubnet",
      "ec2:DeleteSubnet",

      "ec2:CreateSecurityGroup",
      "ec2:DeleteSecurityGroup",

      "ec2:CreateRouteTable",
      "ec2:DeleteRouteTable",
      "ec2:AssociateRouteTable",
      "ec2:ReplaceRouteTableAssociation",

      "ec2:CreateNetworkAcl",
      "ec2:DeleteNetworkAcl",
      "ec2:CreateNetworkAclEntry",
      "ec2:DeleteNetworkAclEntry",
      "ec2:ReplaceNetworkAclEntry",
      "ec2:ReplaceNetworkAclAssociation",

      "ec2:CreateInternetGateway",
      "ec2:DeleteInternetGateway",
      "ec2:AttachInternetGateway",
      "ec2:DetachInternetGateway",

      "ec2:CreateNetworkInterface",
      "ec2:DeleteNetworkInterface",
      "ec2:AttachNetworkInterface",
      "ec2:DetachNetworkInterface",

      "ec2:CreateNatGateway",
      "ec2:DeleteNatGateway",
      "ec2:AssociateNatGatewayAddress",
      "ec2:DisassociateNatGatewayAddress",
      "ec2:AssociatePrivateNatGatewayAddress",
      "ec2:UnassignPrivateNatGatewayAddress",

      "ec2:AllocateAddress",
      "ec2:ReleaseAddress",
      "ec2:AssociateAddress",
    ]
  }
}

resource "aws_iam_policy" "network_management_policy" {
  name        = "NetworkManagementPolicy_${var.tfc_organization_name}_${var.tfc_project_name}_${var.tfc_workspace_name}"
  policy      = data.aws_iam_policy_document.network_management_policy_document.json
  description = "This policy for making network resources"
}

resource "aws_iam_role_policy_attachment" "network_management_policy_attachment" {
  role       = aws_iam_role.terraform_cloud_execution_role.id
  policy_arn = aws_iam_policy.network_management_policy.arn
}