variable "name" {
  description = "VPC name identifier"
}

variable "environment" {
  description = "dev | test | demo | prod"
}

## VPC ##
variable "cidr_block" {
  description = "CIDR block for the VPC"
}

variable "instance_tenancy" {
  description = "tenancy option for instances in this VPC. defalut | dedicated"
  default     = "default"
}

variable "enable_dns_support" {
  description = "enable/disable DNS support in VPC. true | false"
  default     = true
}

variable "enable_dns_hostnames" {
  description = "enable/disable DNS hostnames in VPC. true | false"
  default     = false
}

variable "assign_generated_ipv6_cidr_block" {
  description = "requests an Amazon provided ipv6 CIDR block with a /56 prefix length for the VPC. Cannot specify the range of IP addresses or size of block. true | false"
  default     = false
}

variable "public_subnets" {
  description = "list of public subnets. CIDR blocks"
  default     = []
}

variable "private_subnets" {
  description = "list of private subnets. CIDR blocks"
  default     = []
}

variable "azs" {
  description = "list of availability zones in region"
  default     = []
}

variable "map_public_ip_on_launch" {
  description = "determines if instances launced in subnet will be assigned a public ip. aws default is false."
  default     = "true"
}
