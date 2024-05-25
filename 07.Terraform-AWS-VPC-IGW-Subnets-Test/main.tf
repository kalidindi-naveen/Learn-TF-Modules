module "vpc-made-easy" {
  source              = "../04.Terraform-AWS-VPC-IGW"
  common_tags         = var.common_tags
  project_name        = var.project_name
  public_subnet_cidrs = var.public_subnet_cidrs
}