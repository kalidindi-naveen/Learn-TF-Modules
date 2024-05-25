resource "aws_instance" "this" {
  ami                    = var.ami
  vpc_security_group_ids = var.vpc_security_group_ids
  instance_type          = var.instance_type
  tags                   = var.tags
}