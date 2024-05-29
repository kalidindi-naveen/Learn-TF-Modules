output "azs_info" {
  value = data.aws_availability_zones.this.names
}

output "vpc_id" {
  value = aws_vpc.this.id
}

output "pub_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "pri_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "db_subnet_ids" {
  value = aws_subnet.database[*].id
}

output "db_subnet_group_id" {
  value = aws_db_subnet_group.this.id
}

output "db_subnet_group_name" {
  value = aws_db_subnet_group.this.name
}