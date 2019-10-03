resource "aws_route_table" "private" {
  count = length(var.availability_zones)

  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main[count.index].id
  }

  tags = merge(
    {
      "Name" = format("private-%s-route-table", var.availability_zones[count.index]),
    },
    local.common_tags
  )
}

resource "aws_route_table_association" "private" {
  count = length(var.availability_zones)

  route_table_id = aws_route_table.private[count.index].id
  subnet_id      = aws_subnet.private[count.index].id
}

resource "aws_route_table" "public" {
  count = length(var.availability_zones)

  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = merge(
    {
      "Name" = format("public-subnet-%s-route-table", var.availability_zones[count.index]),
    },
    local.common_tags
  )
}

resource "aws_route_table_association" "public" {
  count = length(var.availability_zones)

  route_table_id = aws_route_table.public[count.index].id
  subnet_id      = aws_subnet.public[count.index].id
}