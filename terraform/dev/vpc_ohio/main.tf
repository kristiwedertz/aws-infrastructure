## PROVIDER ##
provider "aws" {
  region = "${var.region}"
}

## BACKEND CONFIG ##
terraform {
  backend "s3" {
    region         = "us-east-2"
    bucket         = "terraform-remote-state-kristi-wedertz-573-us-east-2"
    key            = "vpc-ohio/terraform.tfstate"
    dynamodb_table = "terraform-remote-state"
  }
}

## DATA SOURCES ##
data "aws_availability_zones" "available" {}

module "vpc_ohio" {
  source          = "../../modules/vpc"
  name            = "${var.environment}-ohio"
  environment     = "${var.environment}"
  cidr_block      = "172.31.0.0/16"
  azs             = "${data.aws_availability_zones.available.names}"
  public_subnets  = ["172.31.48.0/23", "172.31.50.0/23", "172.31.52.0/23"]
  private_subnets = ["172.31.16.0/20", "172.31.32.0/20", "172.31.0.0/20"]
}
