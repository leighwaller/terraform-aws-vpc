resource "aws_subnet" "public" {
  count = length(data.aws_availability_zones)

  vpc_id = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr_block

  availability_zone = data.aws_availability_zones.current[count.index]

  tags = merge(
    {
      "Name" = format("public-subnet-%s", data.aws_availability_zones[count.index].id),
      "Type" = "public"
    },
    local.common_tags
  )
}

resource "aws_subnet" "private" {
  count = length(data.aws_availability_zones)

  vpc_id = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr_block
  availability_zone = data.aws_availability_zones.current[count.index]

  tags = merge(
    {
      "Name" = format("private-subnet-%s", data.aws_availability_zones[count.index].id),
      "Type" = "private"
    },
    local.common_tags
  )
}

resource "aws_eip" "nat" {
  count = length(data.aws_availability_zones)

  vpc = true
  tags = merge(
    {
      "Name" = format("nat-ip-%s", data.aws_availability_zones.current[count.index].id),
    },
    local.common_tags
  )
}

resource "aws_nat_gateway" "main" {
  count = length(data.aws_availability_zones)

  allocation_id = aws_eip.nat[count.index].id
  subnet_id = aws_subnet.public[count.index].id

  tags = merge(
    {
      "Name" = format("nat-gateway-%s", data.aws_availability_zones.current[count.index].id),
    },
    local.common_tags
  )
}

# todo optional internet gateway