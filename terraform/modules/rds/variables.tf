variable "identifier" {
  description = "Identificador da instância RDS"
  type        = string
}

variable "database_name" {
  description = "Nome do banco de dados"
  type        = string
}

variable "username" {
  description = "Usuário do banco"
  type        = string
}

variable "password" {
  description = "Senha do banco"
  type        = string
  sensitive   = true
}

variable "private_subnet_ids" {
  description = "IDs das subnets privadas"
  type        = list(string)
}

variable "vpc_id" {
  description = "ID da VPC"
  type        = string
}