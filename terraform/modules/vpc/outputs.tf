output "vpc_id" {
  description = "ID da VPC"
  value       = aws_vpc.togglemaster.id
}

output "vpc_cidr" {
  description = "CIDR da VPC"
  value       = aws_vpc.togglemaster.cidr_block
}

output "public_subnet_ids" {
  description = "IDs das subnets públicas"
  value = [
    aws_subnet.public_a.id,
    aws_subnet.public_b.id
  ]
}

output "private_subnet_ids" {
  description = "IDs das subnets privadas"
  value = [
    aws_subnet.private_a.id,
    aws_subnet.private_b.id
  ]
}
