resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block

  enable_dns_support   = var.enable_dns
  enable_dns_hostnames = var.enable_dns

  instance_tenancy = var.instance_tenancy

  tags = merge(
    {
      "Name" = format("%s", var.vpc_name)
    },
    local.common_tags
  )
}