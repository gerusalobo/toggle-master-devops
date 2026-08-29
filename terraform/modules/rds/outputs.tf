output "endpoint" {
  description = "Endpoint do RDS"
  value       = aws_db_instance.auth.address
}

output "port" {
  description = "Porta do PostgreSQL"
  value       = aws_db_instance.auth.port
}

output "database_name" {
  description = "Nome do banco"
  value       = aws_db_instance.auth.db_name
}

output "username" {
  description = "Usuário do banco"
  value       = aws_db_instance.auth.username
  sensitive   = true
}

output "security_group_id" {
  description = "Security Group do RDS"
  value       = aws_security_group.auth.id
}