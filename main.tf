terraform {
  backend "s3" {
    # variables must be hardcoded here
    bucket         = "vogt4nick.com-terraform-state"
    dynamodb_table = "vogt4nick.com-terraform-state-lock"
    encrypt        = true
    key            = "vogt4nick.com-terraform-state/prod/infra.tfstate"
    region         = "us-east-1"
  }
  required_version = "= 0.12.28"
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
  version = "~> 2.70"
}
