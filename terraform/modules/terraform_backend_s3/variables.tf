variable "region" {
  description = "AWS Region"
  default     = ""
}

variable "name" {
  description = "Name of Terraform Backend Resources"
  default     = "terraform-remote-state"
}

variable "environment" {
  description = "Development Environment. dev | test | demo | prod"
  default     = ""
}

variable "hash_key" {
  description = "attribute to use as the hash (partition) key for dynamodb table"
  default     = "LockID"
}

variable "read_capacity" {
  description = "number of read units for this table"
  default     = "30"
}

variable "write_capacity" {
  description = "number of write units for this table"
  default     = "30"
}

variable "type" {
  description = "attribute type, type for hash_key. S | N | B (string, number binary)"
  default     = "S"
}

variable "versioning" {
  description = "enable versioning. true | false"
  default     = "true"
}
