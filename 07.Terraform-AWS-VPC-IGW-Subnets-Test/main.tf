module "vpc-made-easy" {
  source              = "../06.Terraform-AWS-VPC-IGW-Subnets"
  common_tags         = var.common_tags
  project_name        = var.project_name
  public_subnet_cidrs = var.public_subnet_cidrs
}