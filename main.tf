locals {
  tags = {
    "Name" = "${var.vpc_name}"
    "Environment" = "${var.environment}"
  }
}

resource "aws_vpc" "main" {
  cidr_block = "${var.cidr_block}"

  tags = "${local.tags}"
}