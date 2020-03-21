########################################################################
# essentials/s3-tfstate.tf
########################################################################

resource "aws_s3_bucket" "tfstate" {
  bucket = local.bucket_name_tfstate
  acl    = "private"

  versioning {
    enabled = true
  }


  lifecycle_rule {
    id      = "old-version-rolloff"
    enabled = true

    noncurrent_version_transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    noncurrent_version_expiration {
      days          = 400
    }
  }

  lifecycle {
    prevent_destroy = true
  }


  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
  }


  tags = {
    Name = local.bucket_name_tfstate
  }
}



resource "aws_s3_bucket_public_access_block" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
