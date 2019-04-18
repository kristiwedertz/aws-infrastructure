variable "region" {
  description = "AWS region"
  default     = "us-east-2"
}

provider "aws" {
  region = "${var.region}"
}

module "terraform_backend_ohio" {
  source      = "../../modules/terraform_backend_s3"
  region      = "${var.region}"
  environment = "dev"
}

output "bucket_name" {
  value = "${module.terraform_backend_ohio.bucket_name}"
}
