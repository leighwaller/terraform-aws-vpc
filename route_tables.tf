resource "aws_route_table" "private" {
  count = length(data.aws_availability_zones.current.names)

  vpc_id = aws_vpc.main.id

  tags = merge(
    {
      "Name" = format("private-%s-route-table", data.aws_availability_zones.current.names[count.index]),
    },
    local.common_tags
  )
}

resource "aws_route_table_association" "private" {
  count = length(data.aws_availability_zones.current.names)

  route_table_id = aws_route_table.private[count.index].id
  subnet_id      = aws_subnet.private[count.index].id
}

resource "aws_route" "private_nat" {
  count = length(data.aws_availability_zones.current.names)

  route_table_id         = aws_route_table.private[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.main[count.index].id

  timeouts {
    create = "5m"
  }
}

resource "aws_route_table" "public" {
  count = length(data.aws_availability_zones.current.names)

  vpc_id = aws_vpc.main.id

  tags = merge(
    {
      "Name" = format("public-subnet-%s-route-table", data.aws_availability_zones.current.names[count.index]),
    },
    local.common_tags
  )
}

resource "aws_route_table_association" "public" {
  count = length(data.aws_availability_zones.current.names)

  route_table_id = aws_route_table.public[count.index].id
  subnet_id      = aws_subnet.public[count.index].id
}

resource "aws_route" "public_igw" {
  count = length(data.aws_availability_zones.current.names)

  route_table_id         = aws_route_table.private[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id

  timeouts {
    create = "5m"
  }
}