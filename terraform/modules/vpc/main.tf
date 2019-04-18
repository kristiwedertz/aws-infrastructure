## VPC ##
resource "aws_vpc" "main" {
  cidr_block = "${var.cidr_block}"
  instance_tenancy = "${var.instance_tenancy}"
  enable_dns_support = "${var.enable_dns_support}"
  enable_dns_hostnames = "${var.enable_dns_hostnames}"
  assign_generated_ipv6_cidr_block = "${var.assign_generated_ipv6_cidr_block}"

  tags = {
    name = "${var.vpc_name}"
    environment = "${var.environment}"
  }
}


## ROUTE TABLES ##
## INTERNET GATEWAYS ##
## NAT ##
## SUBNETS ##
