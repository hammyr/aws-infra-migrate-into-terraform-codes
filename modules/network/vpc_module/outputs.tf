output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.vpc.id
}

# public subnets
output "public_subnet_1" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.public_subnet_1.id
}

output "public_subnet_2" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.public_subnet_2.id
}

output "public_route_table_ids" {
  description = "List of IDs of public route tables"
  value       = aws_route_table.public_rt_1.id
}

# private_subnets outputs
output "private_subnet_1" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.private_subnet_1.id
}

output "private_subnet_2" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.private_subnet_2.id
}

output "private_route_table_ids" {
  description = "List of IDs of private route tables"
  value       = aws_route_table.private_rt_1.id
}

# db outputs
output "database_subnets_1" {
  description = "List of IDs of database subnets"
  value       = aws_subnet.db_subnet_1.id
}

output "database_subnets_2" {
  description = "List of IDs of database subnets"
  value       = aws_subnet.db_subnet_2.id
}

output "database_route_table_ids" {
  description = "List of IDs of database route tables"
  value = aws_route_table.db_rt_1.id
}

