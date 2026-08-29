resource "aws_ecr_repository" "auth" {
  name                 = "togglemaster/auth-service"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "togglemaster-auth-service"
  }
}

resource "aws_ecr_repository" "flag" {
  name                 = "togglemaster/flag-service"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "togglemaster-flag-service"
  }
}

resource "aws_ecr_repository" "targeting" {
  name                 = "togglemaster/targeting-service"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "togglemaster-targeting-service"
  }
}

resource "aws_ecr_repository" "evaluation" {
  name                 = "togglemaster/evaluation-service"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "togglemaster-evaluation-service"
  }
}

resource "aws_ecr_repository" "analytics" {
  name                 = "togglemaster/analytics-service"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "togglemaster-analytics-service"
  }
}