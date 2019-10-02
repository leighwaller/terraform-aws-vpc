# todo public subnet should be optional
resource "aws_subnet" "public" {
  count = length(data.aws_availability_zones.current)

  vpc_id = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr_block

  availability_zone = data.aws_availability_zones.current[count.index]

  tags = merge(
    {
      "Name" = format("public-subnet-%s", data.aws_availability_zones.current[count.index].id),
      "Type" = "public"
    },
    local.common_tags
  )
}

resource "aws_network_acl" "public" {
  # single acl shared accross all public subnets
  count = 1

  vpc_id = aws_vpc.main.id
  subnet_ids = [aws_subnet.public.*.id]

  tags = merge(
  {
    "Name" = "public-network-acl",
    "Type" = "public"
  },
  local.common_tags
  )
}

resource "aws_network_acl_rule" "public_inbound" {
  count = length(var.public_inbound_acl_rules)

  network_acl_id = aws_network_acl.public[0].id

  rule_number = var.public_inbound_acl_rules[count.index]["rule_number"]
  rule_action = var.public_inbound_acl_rules[count.index]["rule_action"]
  from_port = lookup(var.public_inbound_acl_rules[count.index], "from_port", null)
  to_port = lookup(var.public_inbound_acl_rules[count.index], "to_port", null)
  icmp_code = lookup(var.public_inbound_acl_rules[count.index], "icmp_code", null)
  icmp_type = lookup(var.public_inbound_acl_rules[count.index], "icmp_type", null)
  protocol = var.public_inbound_acl_rules[count.index]["protocol"]
  cidr_block = lookup(var.public_inbound_acl_rules[count.index], "cidr_block", null)
}

resource "aws_network_acl_rule" "public_outbound" {
  count = length(var.public_outbound_acl_rules)

  network_acl_id = aws_network_acl.public[0].id

  rule_number = var.public_outbound_acl_rules[count.index]["rule_number"]
  rule_action = var.public_outbound_acl_rules[count.index]["rule_action"]
  from_port = lookup(var.public_outbound_acl_rules[count.index], "from_port", null)
  to_port = lookup(var.public_outbound_acl_rules[count.index], "to_port", null)
  icmp_code = lookup(var.public_outbound_acl_rules[count.index], "icmp_code", null)
  icmp_type = lookup(var.public_outbound_acl_rules[count.index], "icmp_type", null)
  protocol = var.public_outbound_acl_rules[count.index]["protocol"]
  cidr_block = lookup(var.public_outbound_acl_rules[count.index], "cidr_block", null)
  egress = true
}

resource "aws_subnet" "private" {
  count = length(data.aws_availability_zones.current)

  vpc_id = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr_block
  availability_zone = data.aws_availability_zones.current[count.index]

  tags = merge(
    {
      "Name" = format("private-subnet-%s", data.aws_availability_zones.current[count.index].id),
      "Type" = "private"
    },
    local.common_tags
  )
}

resource "aws_network_acl" "private" {
  # single acl shared accross all private subnets
  count = 1

  vpc_id = aws_vpc.main.id
  subnet_ids = [aws_subnet.private.*.id]

  tags = merge(
  {
    "Name" = "private-network-acl",
    "Type" = "private"
  },
  local.common_tags
  )
}

resource "aws_network_acl_rule" "private_inbound" {
  count = length(var.private_inbound_acl_rules)

  network_acl_id = aws_network_acl.private[0].id

  rule_number = var.private_inbound_acl_rules[count.index]["rule_number"]
  rule_action = var.private_inbound_acl_rules[count.index]["rule_action"]
  from_port = lookup(var.private_inbound_acl_rules[count.index], "from_port", null)
  to_port = lookup(var.private_inbound_acl_rules[count.index], "to_port", null)
  icmp_code = lookup(var.private_inbound_acl_rules[count.index], "icmp_code", null)
  icmp_type = lookup(var.private_inbound_acl_rules[count.index], "icmp_type", null)
  protocol = var.private_inbound_acl_rules[count.index]["protocol"]
  cidr_block = lookup(var.private_inbound_acl_rules[count.index], "cidr_block", null)
}

resource "aws_network_acl_rule" "private_outbound" {
  count = length(var.private_outbound_acl_rules)

  network_acl_id = aws_network_acl.private[0].id

  rule_number = var.private_outbound_acl_rules[count.index]["rule_number"]
  rule_action = var.private_outbound_acl_rules[count.index]["rule_action"]
  from_port = lookup(var.private_outbound_acl_rules[count.index], "from_port", null)
  to_port = lookup(var.private_outbound_acl_rules[count.index], "to_port", null)
  icmp_code = lookup(var.private_outbound_acl_rules[count.index], "icmp_code", null)
  icmp_type = lookup(var.private_outbound_acl_rules[count.index], "icmp_type", null)
  protocol = var.private_outbound_acl_rules[count.index]["protocol"]
  cidr_block = lookup(var.private_outbound_acl_rules[count.index], "cidr_block", null)
  egress = true
}

resource "aws_eip" "nat" {
  count = length(data.aws_availability_zones.current)

  vpc = true
  tags = merge(
    {
      "Name" = format("nat-ip-%s", data.aws_availability_zones.current[count.index].id),
    },
    local.common_tags
  )
}

resource "aws_nat_gateway" "main" {
  count = length(data.aws_availability_zones.current)

  allocation_id = aws_eip.nat[count.index].id
  subnet_id = aws_subnet.public[count.index].id

  tags = merge(
    {
      "Name" = format("nat-gateway-%s", data.aws_availability_zones.current[count.index].id),
    },
    local.common_tags
  )
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = merge(
    {
      "Name" = format("$s-internet-gateway", var.vpc_name)
    },
    local.common_tags
  )
}