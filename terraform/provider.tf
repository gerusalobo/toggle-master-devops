terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.38"
    }
  }

  required_version = ">= 1.16.0"

  backend "s3" {
    bucket = "togglemaster-terraform-state-943048301123"
    key    = "togglemaster/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "lab"
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}