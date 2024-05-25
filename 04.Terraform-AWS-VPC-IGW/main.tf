resource "aws_vpc" "this" {
  cidr_block           = var.cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = merge(
    var.common_tags,
    var.vpc_tags,
    {
      Name = "${var.project_name}-${var.environment}"
    }
  )
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags = merge(
    var.common_tags,
    var.igw_tags,
    {
      Name = "${var.project_name}-${var.environment}"
    }
  )
}