resource "aws_eks_cluster" "togglemaster" {
  name     = var.cluster_name
  role_arn = var.cluster_role_arn
  version  = var.cluster_version

  vpc_config {
    subnet_ids              = var.private_subnet_ids
    endpoint_private_access = true
    endpoint_public_access  = true
  }

  tags = {
    Name = "togglemaster-cluster"
  }
}

resource "aws_eks_node_group" "togglemaster" {
  cluster_name    = aws_eks_cluster.togglemaster.name
  node_group_name = "togglemaster-nodegroup"
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.private_subnet_ids

  instance_types = ["t3.medium"]

  scaling_config {
    desired_size = 2
    min_size     = 1
    max_size     = 4
  }

  update_config {
    max_unavailable = 1
  }

  tags = {
    Name = "togglemaster-nodegroup"
  }

  depends_on = [
    aws_eks_cluster.togglemaster
  ]
}