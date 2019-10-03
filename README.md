# Terraform AWS VPC

A terraform module that will provision the necessary infrastructure for a basic AWS VPC.
The VPC will contain public and private subnets across multiple availability zones.

#### Resources
The following is a basic outline of the resources created by this module.
Note that some can be disabled using variables.

* VPC
* Private Subnets
* Public Subnets
* NAT Gateways
* Route Tables  

## Usage

#### Requirements
Terraform version 0.12.9

#### Example

```hlc
module "vpc" {
  source = "github.com/leighwaller/terraform-aws-vpc"
  
  vpc_name = "example_vpc"
}
```

See the examples directory for more information. 


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| region | The AWS region that resources will be created in | string | `"ap-southeast-2"` | no |
| vpc\_name | Short name to identify this VPC | string | n/a | yes |
| environment | The environment this VPC is created in. Eg. dev/qa/production | string | `"dev"` | no |
| vpc_cidr\_block | The IP address range (CIDR block) that will be allocated to the VPC | string | `"10.0.0.0/16"` | no |
| enable\_dns | When set to true, EC2 instances with public IP addresses will also receive a public hostname that can be resolved to IP addresses using the AWS provided DNS server | string | `"true"` | no |
| instance\_tenancy | The tenancy option for EC2 instances launched into this VPC. Valid options are default and dedicated. | string | `"default"` | no |
| availability\_zones | List of availability zone ids that subnets will be placed in | list<string> | `"ap-southeast-2a","ap-southeast-2b","ap-southeast-2c"` | no |
| public\_subnet\_cidr\_blocks | List of IP address ranges (CIDR block) that will be allocated to the public subnets | list<string> | `"10.0.101.0/24","10.0.102.0/24","10.0.103.0/24"` | no |
| private\_subnet\_cidr\_blocks | List of IP address ranges (CIDR block) that will be allocated to the private subnets | list<string> | `"10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"` | no |
| public\_inbound\_acl\_rules | Inbound network ACL's associated with the public subnet | list<map<string>> | `"allow all"` | no |
| public\_outbound\_acl\_rules | Outbound network ACL's associated with the public subnet | list<map<string>> | `"allow all"` | no |
| private\_inbound\_acl\_rules | Inbound network ACL's associated with the private subnet | list<map<string>> | `"allow all"` | no |
| private\_outbound\_acl\_rules | Outbound network ACL's associated with the private subnet | list<map<string>> | `"allow all"` | no |

## Outputs

| Name | Description |
|------|-------------|
| vpc\_arn | THe Amazon Resource Name of the VPC |
| vpc\_cidr\_block | The IP address range (CIDR block) that is available to the VPC |
| vpc\_dns\_support | Indicates whether DNS support is enabled or disabled for this VPC |
| vpc\_id | THe ID of the VPC |
| vpc\_instance\_tenancy | The EC2 instance tenancy option set on this VPC |
| vpc\_route\_table\_id | The ID of the main route table associated with this VPC |
| private\_subnet\_ids | List of the private subnet IDs |
| private\_subnet\_arns | List of the private subnet ARNs |
| private\_subnet\_cidr\_blocks | List of of private subnet CIDR blocks |
| public\_subnet\_ids | List of the public subnet IDs |
| public\_subnet\_arns | List of the public subnet ARNs |
| public\_subnet\_cidr\_blocks | List of of public subnet CIDR blocks |
| public\_route\_table\_ids | List of public route table IDs |
| private\_route\_table\_ids | List of private route table IDs |
| nat\_gateway\_ids | List of the NAT gateway IDs |
| internet\_gateway\_id | The ID of the internet gateway |
| nat\_elastic\_ips | List of elastic IPs associated with the NAT gateway |
| nat\_elastic\_ids | List of elastic IP IDs associated with the NAT gateway |
| public\_acl\_ids | List of network ACL IDs associated with the public subnet|
| private\_acl\_ids | List of network ACL IDs associated with the private subnet |

