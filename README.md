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
| cidr\_block | The IP address range (CIDR block) that will be allocated to the VPC | string | `"10.0.0.0/16"` | no |
| enable\_dns | When set to true, EC2 instances with public IP addresses will also receive a public hostname that can be resolved to IP addresses using the AWS provided DNS server | string | `"true"` | no |
| environment | The environment this VPC is created in. Eg. dev/qa/production | string | `"dev"` | no |
| instance\_tenancy | The tenancy option for EC2 instances launched into this VPC. Valid options are default and dedicated. | string | `"default"` | no |
| name | Short name to identify this VPC | string | n/a | yes |
| region | The AWS region that resources will be created in | string | `"ap-southeast-2"` | no |

## Outputs

| Name | Description |
|------|-------------|
| vpc\_arn | THe Amazon Resource Name of the VPC |
| vpc\_cidr\_block | The IP address range (CIDR block) that is available to the VPC |
| vpc\_dns\_support | Indicates whether DNS support is enabled or disabled for this VPC |
| vpc\_id | THe ID of the VPC |
| vpc\_instance\_tenancy | The EC2 instance tenancy option set on this VPC |
| vpc\_route\_table\_id | The ID of the main route table associated with this VPC |
