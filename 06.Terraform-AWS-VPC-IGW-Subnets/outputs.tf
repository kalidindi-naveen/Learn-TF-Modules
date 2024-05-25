output "azs_info" {
  value = data.aws_availability_zones.this.names
}