## VPC ##
resource "aws_vpc" "this" {
  cidr_block                       = "${var.cidr_block}"
  instance_tenancy                 = "${var.instance_tenancy}"
  enable_dns_support               = "${var.enable_dns_support}"
  enable_dns_hostnames             = "${var.enable_dns_hostnames}"
  assign_generated_ipv6_cidr_block = "${var.assign_generated_ipv6_cidr_block}"

  tags = {
    Name        = "${var.name}"
    Environment = "${var.environment}"
  }
}

## ROUTE TABLES ##
##resource "aws_route_table" "this" {}

## INTERNET GATEWAYS ##
resource "aws_internet_gateway" "this" {
  vpc_id = "${aws_vpc.this.id}"

  tags {
    Name       = "${var.name}"
    Environemt = "${var.environment}"
  }
}

## NAT ##
#resource "aws_nat_gateway" "this" {
#  allocation_id = "${}"
#  subnet_id = "${}"
#  depends_on = ["aws_internet_gateway.this"]
#
#  tags {
#    Name = "${var.name}"
#    Environment = "${var.environment}"
#  }
#}
## SUBNETS ##
resource "aws_subnet" "public" {
  count = "${length(var.public_subnets)}" 
  
  vpc_id = "${aws_vpc.this.id}"
  availability_zone = "${element(var.azs, count.index)}"
  cidr_block = "${element(var.public_subnets, count.index)}"
  map_public_ip_on_launch = "${var.map_public_ip_on_launch}"
  
  tags {
    Name = "${element(var.azs, count.index)}-public"
    Environment = "${var.environment}"
  }
}

resource "aws_subnet" "private" {
  count = "${length(var.private_subnets)}" 
  
  vpc_id = "${aws_vpc.this.id}"
  availability_zone = "${element(var.azs, count.index)}"
  cidr_block = "${element(var.private_subnets, count.index)}"
  
  tags {
    Name = "${element(var.azs, count.index)}-private"
    Environment = "${var.environment}"
  }
}
