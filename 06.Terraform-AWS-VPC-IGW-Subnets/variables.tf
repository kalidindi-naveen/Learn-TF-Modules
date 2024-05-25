variable "project_name" {
  type = string
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "common_tags" {
  type = map(any)
}

### VPC
variable "cidr_block" {
  default = "10.0.0.0/16"
  type    = string
}

variable "enable_dns_hostnames" {
  default = true
  type    = bool
}

variable "vpc_tags" {
  type    = map(any)
  default = {}
}

variable "public_subnet_cidrs" {
  type = list(string)
  validation {
    condition     = length(var.public_subnet_cidrs) == 2
    error_message = "Please Provide 2 Subnets CIDR's Only"
  }
}

variable "public_subnet_cidr_tags" {
  type    = map(any)
  default = {}
}
### IGW
variable "igw_tags" {
  type    = map(any)
  default = {}
}