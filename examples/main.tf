module "vpc" {
//  source = "git::https://github.com/leighwaller/terraform-aws-vpc?ref=v1.0.0"
  source = "../"
  vpc_name = "example_vpc"
}