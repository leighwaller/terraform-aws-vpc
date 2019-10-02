resource "aws_route_table" "private" {
  count = length(data.aws_availability_zones)

  vpc_id = aws_vpc.main.id

  tags = merge(
    {
      "Name" = format("%s_route_table", var.vpc_name),
    },
    local.common_tags
  )

}

resource "aws_route_table_association" "private" {
  count = length(data.aws_availability_zones)

  route_table_id = aws_route_table.private[count.index].id
  subnet_id = aws_subnet.private[count.index].id
}

resource "aws_route" "private_nat" {
  count = length(data.aws_availability_zones)

  route_table_id = aws_route_table.private[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.main.id

  timeouts {
    create = "5m"
  }
}

