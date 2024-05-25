locals {
  resource_name = "${var.project_name}-${var.environment}"
  az_names      = slice(data.aws_availability_zones.this.names, 0, 2)
}