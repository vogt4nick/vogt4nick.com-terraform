terraform {
  backend "s3" {
    # variables must be hardcoded here
    bucket         = "vogt4nick.com-terraform-state"
    dynamodb_table = "vogt4nick.com-terraform-state-lock"
    encrypt        = true
    key            = "vogt4nick.com-terraform-state/prod/infra.tfstate"
    region         = "us-east-1"
  }
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.63"
    }
  }
}

provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}
