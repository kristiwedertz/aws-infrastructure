variable "region" {
  description = "AWS region"
  default     = "us-east-2"
}

variable "environment" {
  description = "development environement. dev | test | demo | prod"
  default     = "dev"
}
