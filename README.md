# Terraform AWS VPC

A terraform module that will provision the necessary infrastructure for a basic AWS VPC.

#### Resources
The following is a basic outline of the resources created by this module. Some can be disabled using variables.
* VPC
* Private Subnet
* Public Subnet
    

## Usage

#### Requirements
Terraform version 0.12.9

#### Example

```hlc
module "vpc" {
  source = "github.com/leighwaller/terraform-aws-vpc"
  
  name = "example_vpc"
}
```

See the examples directory for more information. 



## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cidr\_block | The IP address range (CIDR block) that the vpc will be allocated | string | `"10.0.0.0/16"` | no |
| environment | The environment this VPC is created in. Eg. dev/qa/production | string | `"dev"` | no |
| region | The AWS region that resources will be created in | string | `"ap-southeast-2"` | no |
| name | Short name to identify this vpc | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| vpc\_arn | THe Amazon Resource Name of the VPC |
| vpc\_id | THe ID of the VPC |
