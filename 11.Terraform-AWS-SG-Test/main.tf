data "aws_ssm_parameter" "this" {
  name = "/expense/dev/vpc_id"
}

module "sg-made-easy" {
  source         = "../10.Terraform-AWS-SG"
  project_name   = var.project_name
  environment    = var.environment
  sg_name        = var.sg_name
  vpc_id         = data.aws_ssm_parameter.this.id
  sg_description = var.sg_description
  ingress        = var.ingress
}