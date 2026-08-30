output "vpc_id" {
  description = "ID da VPC ToggleMaster"
  value       = module.vpc.vpc_id
}

output "vpc_cidr" {
  description = "CIDR da VPC ToggleMaster"
  value       = module.vpc.vpc_cidr
}

output "public_subnet_ids" {
  description = "IDs das subnets públicas"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs das subnets privadas"
  value       = module.vpc.private_subnet_ids
}

output "auth_repository_url" {
  value = module.ecr.auth_repository_url
}

output "flag_repository_url" {
  value = module.ecr.flag_repository_url
}

output "targeting_repository_url" {
  value = module.ecr.targeting_repository_url
}

output "evaluation_repository_url" {
  value = module.ecr.evaluation_repository_url
}

output "analytics_repository_url" {
  value = module.ecr.analytics_repository_url
}

output "auth_rds_endpoint" {
  description = "Endpoint do RDS do Auth"
  value       = module.rds_auth.endpoint
}

output "auth_rds_port" {
  description = "Porta do RDS do Auth"
  value       = module.rds_auth.port
}

output "auth_rds_database" {
  description = "Database do Auth"
  value       = module.rds_auth.database_name
}

output "auth_rds_security_group_id" {
  description = "Security Group do RDS do Auth"
  value       = module.rds_auth.security_group_id
}