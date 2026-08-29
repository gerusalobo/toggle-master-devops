variable "cluster_name" {
  description = "Nome do cluster EKS"
  type        = string
}

variable "cluster_version" {
  description = "Versão do Kubernetes"
  type        = string
  default     = "1.36"
}

variable "cluster_role_arn" {
  description = "ARN da IAM Role do cluster EKS"
  type        = string
}

variable "node_role_arn" {
  description = "ARN da IAM Role dos nodes"
  type        = string
}

variable "vpc_id" {
  description = "ID da VPC"
  type        = string
}

variable "private_subnet_ids" {
  description = "IDs das subnets privadas"
  type        = list(string)
}