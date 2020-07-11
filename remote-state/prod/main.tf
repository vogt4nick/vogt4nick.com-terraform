# Initial setup of terraform backend
# https://stackoverflow.com/a/48362341

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
  version = "~> 2.70"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "vogt4nick.com-terraform-state"

  versioning { enabled = true }
  lifecycle { prevent_destroy = false }
  tags = var.common_tags
}

# block all public access to the terraform state s3 bucket
resource "aws_s3_bucket_public_access_block" "terraform_state" {
    bucket = aws_s3_bucket.terraform_state.id
    block_public_acls = true
    block_public_policy = true
    ignore_public_acls = true
    restrict_public_buckets = true
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "${aws_s3_bucket.terraform_state.id}-lock"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = var.common_tags
}