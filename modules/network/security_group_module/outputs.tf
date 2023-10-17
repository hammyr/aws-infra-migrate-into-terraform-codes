output "security_group_ids" {
  description = "security_group_ids"
  value = aws_security_group.security_group.id 
}


# alb_sg output
output "dev_alb_sg_id" {
  description = "dev_alb_sg_id"
  value       = aws_security_group.alb_sg.id
}

# app_sg output
output "dev_app_sg_id" {
  description = "dev_app_sg_id"
  value       = aws_security_group.app_sg.id
}

# db_sg output
output "dev_db_sg_id" {
  description = "dev_db_sg_id"
  value       = aws_security_group.db_sg.id
}

