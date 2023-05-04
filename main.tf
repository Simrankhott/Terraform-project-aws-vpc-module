resource "aws_vpc" "myvpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "myvpc"
  }
}

variable "subnets_cidr" {
  description = "Total number of subnets"
  type        = map(string)
  default = {
    "us-east-1a" = "10.0.1.0/24",
    "us-east-1b" = "10.0.2.0/24",
    "us-east-1c" = "10.0.3.0/24"
  }
}

resource "aws_subnet" "mysubnet" {
  for_each          = var.subnets_cidr
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = each.value
  availability_zone = each.key

  tags = {
    Name = "each.key"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "myigw"
  }
}

resource "aws_route_table" "myroute" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "myroute"
  }
}

resource "aws_security_group" "mysecurity" {
  name        = "mysecurity"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.myvpc.id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "mysecurity"
  }
}