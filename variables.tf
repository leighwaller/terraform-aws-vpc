variable "region" {
  description = "The AWS region that resources will be created in"
  default = "ap-southeast-2"
}

variable "environment" {
  description = "The environment this VPC is created in. Eg. dev/qa/production"
  default = "dev"
}

variable "name" {
  description = "Short name to identify this VPC"
}

variable "cidr_block" {
  description = "The IP address range (CIDR block) that will be allocated to the VPC"
  default = "10.0.0.0/16"
}

variable "enable_dns" {
  description = "When set to true, EC2 instances with public IP addresses will also receive a public hostname that can be resolved to IP addresses using the AWS provided DNS server"
  default = true
}

variable "instance_tenancy" {
  description = "The tenancy option for EC2 instances launched into this VPC. Valid options are default and dedicated."
  default = "default"
}

