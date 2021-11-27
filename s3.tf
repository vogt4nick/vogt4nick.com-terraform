# We aren't very DRY in this file
# TODO reuse server_side_encryption_configuration configs
# TODO reuse aws_s3_bucket_public_access_block configs

resource "aws_s3_bucket" "access_log" {
  bucket = "vogt4nick.com-access-log"
  acl    = "log-delivery-write"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = var.common_tags
}

resource "aws_s3_bucket_public_access_block" "access_log" {
  bucket                  = aws_s3_bucket.access_log.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


resource "aws_s3_bucket" "vogt4nick_com" {
  bucket = "vogt4nick.com"
  acl    = "private"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  logging {
    target_bucket = aws_s3_bucket.access_log.id
    # would be nice to reference self.id, but we can't yet :(
    # https://github.com/hashicorp/terraform/issues/925
    target_prefix = "vogt4nick.com/"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = var.common_tags
}

resource "aws_s3_bucket" "www_vogt4nick_com" {
  bucket = "www.vogt4nick.com"
  acl    = "private"

  website {
    redirect_all_requests_to = aws_s3_bucket.vogt4nick_com.id
  }

  logging {
    target_bucket = aws_s3_bucket.access_log.id
    # would be nice to reference self.id, but we can't yet :(
    # https://github.com/hashicorp/terraform/issues/925
    target_prefix = "vogt4nick.com/"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = var.common_tags
}

resource "aws_s3_bucket" "blog_vogt4nick_com" {
  bucket = "blog.vogt4nick.com"
  acl    = "private"

  website {
    index_document = "index.html"
    error_document = "404.html"
  }

  logging {
    target_bucket = aws_s3_bucket.access_log.id
    # would be nice to reference self.id, but we can't yet :(
    # https://github.com/hashicorp/terraform/issues/925
    target_prefix = "blog.vogt4nick.com/"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = var.common_tags
}

resource "aws_s3_bucket" "recipes_vogt4nick_com" {
  bucket = "recipes.vogt4nick.com"
  acl    = "private"

  website {
    index_document = "index.html"
    error_document = "404.html"
  }

  logging {
    target_bucket = aws_s3_bucket.access_log.id
    # would be nice to reference self.id, but we can't yet :(
    # https://github.com/hashicorp/terraform/issues/925
    target_prefix = "recipes.vogt4nick.com/"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = var.common_tags
}

resource "aws_s3_bucket" "rezepte_vogt4nick_com" {
  bucket = "rezepte.vogt4nick.com"
  acl    = "private"

  website {
    redirect_all_requests_to = "${aws_s3_bucket.recipes_vogt4nick_com.id}/at"
  }

  logging {
    target_bucket = aws_s3_bucket.access_log.id
    # would be nice to reference self.id, but we can't yet :(
    # https://github.com/hashicorp/terraform/issues/925
    target_prefix = "rezepte.vogt4nick.com/"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = var.common_tags
}
