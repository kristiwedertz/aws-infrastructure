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
## SUBNETS ##

