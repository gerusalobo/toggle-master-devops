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

variable "auth_db_username" {
  type    = string
  default = "togglemaster"
}

variable "auth_db_password" {
  type      = string
  sensitive = true
}

variable "auth_master_key" {
  type      = string
  sensitive = true
}