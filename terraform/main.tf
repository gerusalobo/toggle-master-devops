module "vpc" {
  source = "./modules/vpc"

  vpc_cidr = var.vpc_cidr
}

module "eks" {
  source = "./modules/eks"

  cluster_name    = "togglemaster-cluster"
  cluster_version = "1.36"

  cluster_role_arn = var.lab_role_arn
  node_role_arn    = var.lab_role_arn

  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
}

module "ecr" {
  source = "./modules/ecr"
}

module "rds_auth" {
  source = "./modules/rds"

  identifier = "togglemaster-auth"

  database_name = "auth_db"
  username      = "admin"
  password      = var.auth_db_password

  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
}