module "vpc-made-easy" {
  source       = "../02.Terraform-AWS-VPC"
  common_tags  = var.common_tags
  project_name = var.project_name
}