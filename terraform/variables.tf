variable "aws_region" {
  description = "Região AWS"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR da VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "lab_role_arn" {
  description = "ARN da LabRole do AWS Academy"
  type        = string
}

variable "auth_db_password" {
  description = "Senha do banco PostgreSQL do Auth"
  type        = string
  sensitive   = true
}