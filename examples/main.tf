module "vpc" {
  source = "github.com/leighwaller/terraform-aws-vpc?ref=v1.0.0"
  vpc_name = "example_vpc"
}