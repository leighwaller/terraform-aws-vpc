output "vpc_id" {
  description = "THe ID of the VPC"
  value = "${aws_vpc.main.id}"
}

output "vpc_arn" {
  description = "THe Amazon Resource Name of the VPC"
  value = "${aws_vpc.main.arn}"
}

output "vpc_cidr_block" {
  description = "The IP address range (CIDR block) that is available to the VPC"
  value = "${aws_vpc.main.cidr_block}"
}

output "vpc_ipv6_association_id" {
  description = "The association ID for the IPv6 CIDR block"
  value = "${aws_vpc.main.ipv6_association_id}"
}

output "vpc_ipv6_cidr_block" {
  description = "The IPv6 CIDR block that has been assigned to this VPC"
  value = "${aws_vpc.main.ipv6_cidr_block}"
}

output "vpc_route_table_id" {
  description = "The ID of the main route table associated with this VPC"
  value = "${aws_vpc.main.main_route_table_id}"
}

output "vpc_instance_tenancy" {
  description = "The EC2 instance tenancy option set on this VPC"
  value = "${aws_vpc.main.instance_tenancy}"
}

output "vpc_dns_support" {
  description = "Indicates whether DNS support is enabled or disabled for this VPC"
  value = "${aws_vpc.main.enable_dns_support}"
}

