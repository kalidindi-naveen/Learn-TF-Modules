module "vpc-made-easy" {
  source                = "../08.Terraform-AWS-VPC-IGW-Subnets-Peering"
  common_tags           = var.common_tags
  project_name          = var.project_name
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = var.private_subnet_cidrs
  database_subnet_cidrs = var.database_subnet_cidrs
  enable_peering        = var.enable_peering
}