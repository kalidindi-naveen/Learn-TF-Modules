resource "aws_vpc" "this" {
  cidr_block           = var.cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = merge(
    var.common_tags,
    var.vpc_tags,
    {
      Name = local.resource_name
    }
  )
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags = merge(
    var.common_tags,
    var.igw_tags,
    {
      Name = local.resource_name
    }
  )
}

resource "aws_subnet" "public" {
  count      = length(var.public_subnet_cidrs)
  vpc_id     = aws_vpc.this.id
  cidr_block = var.public_subnet_cidrs[count.index]
  tags = merge(
    var.common_tags,
    var.public_subnet_cidr_tags,
    {
      Name = "${local.resource_name}-public-${local.az_names[count.index]}"
    }
  )
}

resource "aws_subnet" "private" {
  count      = length(var.private_subnet_cidrs)
  vpc_id     = aws_vpc.this.id
  cidr_block = var.private_subnet_cidrs[count.index]
  tags = merge(
    var.common_tags,
    var.private_subnet_cidr_tags,
    {
      Name = "${local.resource_name}-private-${local.az_names[count.index]}"
    }
  )
}

resource "aws_subnet" "database" {
  count      = length(var.database_subnet_cidrs)
  vpc_id     = aws_vpc.this.id
  cidr_block = var.database_subnet_cidrs[count.index]
  tags = merge(
    var.common_tags,
    var.database_subnet_cidr_tags,
    {
      Name = "${local.resource_name}-database-${local.az_names[count.index]}"
    }
  )
}