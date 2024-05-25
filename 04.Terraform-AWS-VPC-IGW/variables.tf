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

### IGW
variable "igw_tags" {
  type    = map(any)
  default = {}
}