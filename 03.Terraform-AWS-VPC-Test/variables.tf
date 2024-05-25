variable "project_name" {
  type    = string
  default = "expense"
}

variable "common_tags" {
  type = map(any)
  default = {
    Project     = "expense",
    Environment = "dev",
    Terraform   = "true"
  }
}