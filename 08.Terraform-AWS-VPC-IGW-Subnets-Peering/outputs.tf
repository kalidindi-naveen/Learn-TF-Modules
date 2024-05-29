output "azs_info" {
  value = data.aws_availability_zones.this.names
}

output "vpc_id" {
  value = aws_vpc.this.id
}