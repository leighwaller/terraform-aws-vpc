locals {
  common_tags = {
    "Environment" = var.environment
  }
}
//
//data "aws_availability_zones" "current" {
//  state = "available"
//}

# see seperate .tf files for resource definitions