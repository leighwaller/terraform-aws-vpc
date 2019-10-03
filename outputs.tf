output "vpc_id" {
  description = "THe ID of the VPC"
  value       = aws_vpc.main.id
}

output "vpc_arn" {
  description = "The Amazon Resource Name of the VPC"
  value       = aws_vpc.main.arn
}

output "vpc_cidr_block" {
  description = "The IP address range (CIDR block) that is available to the VPC"
  value       = aws_vpc.main.cidr_block
}

output "vpc_route_table_id" {
  description = "The ID of the main route table associated with this VPC"
  value       = aws_vpc.main.main_route_table_id
}

output "vpc_instance_tenancy" {
  description = "The EC2 instance tenancy option set on this VPC"
  value       = aws_vpc.main.instance_tenancy
}

output "vpc_dns_support" {
  description = "Indicates whether DNS support is enabled or disabled for this VPC"
  value       = aws_vpc.main.enable_dns_support
}

output "private_subnet_ids" {
  description = "List of the private subnet IDs"
  value       = aws_subnet.private.*.id
}

output "private_subnet_arns" {
  description = "List of the private subnet ARNs"
  value       = aws_subnet.private.*.arn
}

output "private_subnets_cidr_blocks" {
  description = "List of of private subnet CIDR blocks"
  value       = aws_subnet.private.*.cidr_block
}

output "public_subnet_ids" {
  description = "List of the public subnet IDs"
  value       = aws_subnet.public.*.id
}

output "public_subnet_arns" {
  description = "List of the public subnet ARNs"
  value       = aws_subnet.public.*.arn
}

output "public_subnets_cidr_blocks" {
  description = "List of of public subnet CIDR blocks"
  value       = aws_subnet.public.*.cidr_block
}

output "public_route_table_ids" {
  description = "List of public route table IDs"
  value = aws_route_table.public.*.id
}

output "private_route_table_ids" {
  description = "List of private route table IDs"
  value = aws_route_table.private.*.id
}

output "nat_gateway_ids" {
  description = "List of the NAT gateway IDs"
  value       = aws_nat_gateway.main.*.id
}

output "internet_gateway_id" {
  description = "The ID of the internet gateway"
  value       = aws_internet_gateway.main.id
}

output "nat_elastic_ips" {
  description = "List of elastic IPs associated with the NAT gateway"
  value = aws_eip.nat.*.public_ip
}

output "nat_elastic_ip_ids" {
  description = "List of NAT gateway elastic IP IDs"
  value = aws_eip.nat.*.id
}

output "public_acl_ids" {
  description = "List of network ACL IDs associated with the public subnet"
  value = aws_network_acl.public.*.id
}

output "private_acl_ids" {
  description = "List of network ACL IDs associated with the private subnet"
  value = aws_network_acl.private.*.id
}
