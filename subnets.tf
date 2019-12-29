data "aws_availability_zones" "available" {
  state = "available"
}

// 3 Public Subnets
resource "aws_subnet" "public_subnets" {
  vpc_id                  = aws_vpc.default.id
  cidr_block              = "10.0.${count.index * 2 + 1}.0/24"
  availability_zone       = "${data.aws_availability_zones.available.names[count.index]}"
  map_public_ip_on_launch = true

  count = var.public_count

  tags = {
    Name   = "public_10.0.${count.index * 2 + 1}.0_${element(var.availability_zones, count.index)}"
    Author = var.author
    Tool   = var.tool
  }
}

// 2 Private Subnets
resource "aws_subnet" "private_subnets" {
  vpc_id                  = aws_vpc.default.id
  cidr_block              = "10.0.${count.index * 2}.0/24"
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = false

  count = var.private_count

  tags = {
    Name   = "private_10.0.${count.index * 2}.0_${element(var.availability_zones, count.index)}"
    Author = var.author
    Tool   = var.tool
  }
}

// Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.default.id

  tags = {
    Name   = "igw_${var.vpc_name}"
    Author = var.author
    Tool   = var.tool
  }
}

// Static IP for Nat Gateway
resource "aws_eip" "nat" {
  vpc = true

  tags = {
    Name   = "eip-nat_${var.vpc_name}"
    Author = var.author
    Tool   = var.tool
  }
}

// Nat Gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = element(aws_subnet.public_subnets.*.id, 0)

  tags = {
    Name   = "nat_${var.vpc_name}"
    Author = var.author
    Tool   = var.tool
  }
}

// Public Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.default.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name   = "public_rt_${var.vpc_name}"
    Author = var.author
    Tool   = var.tool
  }
}

// Private Route Table
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.default.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name   = "private_rt_${var.vpc_name}"
    Author = var.author
    Tool   = var.tool
  }
}

// Associate public subnets to public route table
resource "aws_route_table_association" "public" {
  count          = var.public_count
  subnet_id      = element(aws_subnet.public_subnets.*.id, count.index)
  route_table_id = aws_route_table.public_rt.id
}

// Associate private subnets to private route table
resource "aws_route_table_association" "private" {
  count          = var.private_count
  subnet_id      = element(aws_subnet.private_subnets.*.id, count.index)
  route_table_id = aws_route_table.private_rt.id
}


resource "aws_network_acl" "public_nacl" {
  vpc_id = "${aws_vpc.default.id}"

  egress{
    protocol = "-1"
    rule_no = 100
    action = "allow"
    cidr_block = "0.0.0.0/0"
    from_port = 0
    to_port = 0
  }

  ingress{
    protocol = "-1"
    rule_no = 200
    action = "allow"
    cidr_block = "0.0.0.0/0"
    from_port = 0
    to_port = 0
  }
}
