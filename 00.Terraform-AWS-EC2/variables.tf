variable "ami" {
  type    = string
  default = "ami-090252cbe067a9e58"
}

variable "vpc_security_group_ids" {
  type    = list(string)
  default = ["sg-0d252c8914c14d476"]
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "tags" {
  type    = map(any)
  default = {}
}