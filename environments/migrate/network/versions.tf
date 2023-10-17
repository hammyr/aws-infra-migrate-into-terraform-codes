# terraform block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  # Adding Backend as S3 for Remote State Storage
  #backend "s3" {}
}

# provider block
provider "aws" {
  region = var.region
  profile = "tf-migrate-admin-1"
}
