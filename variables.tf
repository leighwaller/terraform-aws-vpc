variable "region" {
  description = "The AWS region that resources will be created in"
  default     = "ap-southeast-2"
}

variable "environment" {
  description = "The environment this VPC is created in. Eg. dev/qa/production"
  default     = "dev"
}

variable "vpc_name" {
  description = "Short name to identify this VPC"
}

variable "vpc_cidr_block" {
  description = "The IP address range (CIDR block) that will be allocated to the VPC"
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "List of availability zone ids that subnets will be placed in"
  type = list(string)
  default = [
    "ap-southeast-2a",
    "ap-southeast-2b",
    "ap-southeast-2c"
  ]
}

variable "public_subnet_cidr_blocks" {
  description = "List of IP address ranges (CIDR block) that will be allocated to the public subnets"
  type = list(string)
  default = [
    "10.0.101.0/24",
    "10.0.102.0/24",
    "10.0.103.0/24"
  ]
}

variable "private_subnet_cidr_blocks" {
  description = "List of IP address ranges (CIDR block) that will be allocated to the private subnets"
  type = list(string)
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24"
  ]
}

variable "enable_dns" {
  description = "When set to true, EC2 instances with public IP addresses will also receive a public hostname that can be resolved to IP addresses using the AWS provided DNS server"
  default     = true
}

variable "instance_tenancy" {
  description = "The tenancy option for EC2 instances launched into this VPC. Valid options are default and dedicated."
  default     = "default"
}

# todo make these more restrictive
variable "public_inbound_acl_rules" {
  description = "Inbound network ACL's associated with the public subnet"
  type        = list(map(string))

  default = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_block  = "0.0.0.0/0"
    },
  ]
}

variable "public_outbound_acl_rules" {
  description = "Outbound network ACL's associated with the public subnet"
  type        = list(map(string))

  default = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_block  = "0.0.0.0/0"
    },
  ]
}

variable "private_inbound_acl_rules" {
  description = "Inbound network ACL's associated with the private subnet"
  type        = list(map(string))

  default = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_block  = "0.0.0.0/0"
    },
  ]
}

variable "private_outbound_acl_rules" {
  description = "Outbound network ACL's associated with the private subnet"
  type        = list(map(string))

  default = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_block  = "0.0.0.0/0"
    },
  ]
}