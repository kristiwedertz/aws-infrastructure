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

module "vpc_ohio" {
  source      = "../../modules/vpc"
  name        = "${var.environment}-ohio"
  environment = "${var.environment}"
  cidr_block  = "172.31.0.0/16"
}
