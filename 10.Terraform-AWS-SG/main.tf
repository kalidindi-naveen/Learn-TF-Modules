locals {
  sg_name_final = "${var.project_name}-${var.environment}-${var.sg_name}"
}

resource "aws_security_group" "this" {
  name        = local.sg_name_final
  description = var.sg_description
  vpc_id      = var.vpc_id

  tags = merge(
    var.sg_tags,
    var.common_tags,
    {
      Name = local.sg_name_final
    }
  )

  dynamic "ingress" {
    for_each = var.ingress
    content {
      from_port   = ingress.value["from_port"]
      to_port     = ingress.value["to_port"]
      protocol    = ingress.value["protocol"]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }

  dynamic "egress" {
    for_each = var.egress
    content {
      from_port   = egress.value["from_port"]
      to_port     = egress.value["to_port"]
      protocol    = egress.value["protocol"]
      cidr_blocks = egress.value["cidr_blocks"]
    }
  }
}

