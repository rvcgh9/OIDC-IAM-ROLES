## terraformcloud directory
It's for to make resources to execute terraform command on Terraform Cloud

## How to run
Af first, to fill some variables on variables.tfvars and to modify backend on provider.tf for saving states

```
$ terraform init
$ terraform plan -var-file=variables.tfvars
$ terraform apply -var-file=variables.tfvars
```

## Reference
https://developer.hashicorp.com/terraform/cloud-docs/workspaces/dynamic-provider-credentials/aws-configuration
https://github.com/hashicorp-education/learn-terraform-dynamic-credentials/tree/main/aws/trust