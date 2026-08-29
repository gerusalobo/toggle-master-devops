output "auth_repository_url" {
  value = aws_ecr_repository.auth.repository_url
}

output "flag_repository_url" {
  value = aws_ecr_repository.flag.repository_url
}

output "targeting_repository_url" {
  value = aws_ecr_repository.targeting.repository_url
}

output "evaluation_repository_url" {
  value = aws_ecr_repository.evaluation.repository_url
}

output "analytics_repository_url" {
  value = aws_ecr_repository.analytics.repository_url
}