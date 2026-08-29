resource "aws_db_subnet_group" "auth" {
  name = "${var.identifier}-subnet-group"

  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "${var.identifier}-subnet-group"
  }
}

resource "aws_security_group" "auth" {
  name        = "${var.identifier}-sg"
  description = "Security Group do PostgreSQL do Auth"
  vpc_id      = var.vpc_id

  ingress {
    description = "PostgreSQL vindo da VPC"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.identifier}-sg"
  }
}

resource "aws_db_instance" "auth" {
  identifier = var.identifier

  engine         = "postgres"
  engine_version = "16"

  instance_class = "db.t3.micro"

  allocated_storage = 20
  storage_type      = "gp3"

  db_name  = var.database_name
  username = var.username
  password = var.password
  port     = 5432

  db_subnet_group_name = aws_db_subnet_group.auth.name

  vpc_security_group_ids = [
    aws_security_group.auth.id
  ]

  publicly_accessible = false

  multi_az = false

  backup_retention_period = 0

  skip_final_snapshot = true

  deletion_protection = false

  tags = {
    Name = var.identifier
  }
}