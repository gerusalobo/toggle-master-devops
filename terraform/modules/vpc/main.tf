resource "aws_vpc" "togglemaster" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "togglemaster-vpc"
  }
}

resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.togglemaster.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name                     = "togglemaster-public-subnet-a"
    "kubernetes.io/role/elb" = "1"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.togglemaster.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name                     = "togglemaster-public-subnet-b"
    "kubernetes.io/role/elb" = "1"
  }
}

resource "aws_subnet" "private_a" {
  vpc_id            = aws_vpc.togglemaster.id
  cidr_block        = "10.0.11.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name                              = "togglemaster-private-subnet-a"
    "kubernetes.io/role/internal-elb" = "1"
  }
}

resource "aws_subnet" "private_b" {
  vpc_id            = aws_vpc.togglemaster.id
  cidr_block        = "10.0.12.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name                              = "togglemaster-private-subnet-b"
    "kubernetes.io/role/internal-elb" = "1"
  }
}

resource "aws_internet_gateway" "togglemaster" {
  vpc_id = aws_vpc.togglemaster.id

  tags = {
    Name = "togglemaster-igw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.togglemaster.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.togglemaster.id
  }

  tags = {
    Name = "togglemaster-public-rt"
  }
}

resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_b" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.public.id
}

resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = "togglemaster-nat-eip"
  }
}

resource "aws_nat_gateway" "togglemaster" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_a.id

  tags = {
    Name = "togglemaster-nat"
  }

  depends_on = [
    aws_internet_gateway.togglemaster
  ]
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.togglemaster.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.togglemaster.id
  }

  tags = {
    Name = "togglemaster-private-rt"
  }
}

resource "aws_route_table_association" "private_a" {
  subnet_id      = aws_subnet.private_a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_b" {
  subnet_id      = aws_subnet.private_b.id
  route_table_id = aws_route_table.private.id
}