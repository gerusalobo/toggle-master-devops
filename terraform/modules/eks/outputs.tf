output "cluster_name" {
  description = "Nome do cluster EKS"
  value       = aws_eks_cluster.togglemaster.name
}

output "cluster_endpoint" {
  description = "Endpoint do cluster EKS"
  value       = aws_eks_cluster.togglemaster.endpoint
}

output "cluster_id" {
  description = "ID do cluster EKS"
  value       = aws_eks_cluster.togglemaster.id
}