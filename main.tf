locals {
  tags = {
    "Name" = "${var.name}"
    "Environment" = "${var.environment}"
  }
}

resource "aws_vpc" "main" {
  cidr_block = "${var.cidr_block}"
  enable_dns_support = "${var.enable_dns}"
  enable_dns_hostnames = "${var.enable_dns}"

  instance_tenancy = "${var.instance_tenancy}"

  tags = "${local.tags}"
}