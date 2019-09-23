variable "region" {
  description = "The AWS region that resources will be created in"
  default = "ap-southeast-2"
}

variable "environment" {
  description = "The environment this VPC is created in. Eg. dev/qa/production"
  default = "dev"
}

variable "name" {
  description = "Short name to identify this vpc"
}

variable "cidr_block" {
  description = "The IP address range (CIDR block) that the vpc will be allocated"
  default = "10.0.0.0/16"
}
