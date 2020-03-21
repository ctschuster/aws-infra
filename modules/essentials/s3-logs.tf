########################################################################
# essentials/s3-logs.tf
########################################################################

resource "aws_s3_bucket" "logs" {
  bucket = local.bucket_name_log
  acl    = "private"
  force_destroy = true

  versioning {
    enabled = false
  }


  lifecycle_rule {
    id      = "cycle-logs"
    enabled = true

    transition {
      days                         = 30
      storage_class                = "STANDARD_IA"
    }

    expiration {
      days                         = 75
    }
  }

  lifecycle_rule {
    id      = "tmp"
    prefix  = "tmp/"
    enabled = true

    expiration {
      days                         = 15
    }
  }

  lifecycle {
    prevent_destroy = true
  }


  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AWSCloudTrailAclCheck",
      "Effect": "Allow",
      "Principal": {
        "Service": "cloudtrail.amazonaws.com"
      },
      "Action": "s3:GetBucketAcl",
      "Resource": "arn:aws:s3:::${local.bucket_name_log}"
    },
    {
      "Sid": "AWSCloudTrailWrite",
      "Effect": "Allow",
      "Principal": {
        "Service": "cloudtrail.amazonaws.com"
      },
      "Action": "s3:PutObject",
      "Resource": "arn:aws:s3:::${local.bucket_name_log}/*",
      "Condition": {
        "StringEquals": {
          "s3:x-amz-acl": "bucket-owner-full-control"
        }
      }
    }
  ]
}
POLICY


  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
  }


  tags = {
    Name = local.bucket_name_log
  }
}



resource "aws_s3_bucket_public_access_block" "logs" {
  bucket = aws_s3_bucket.logs.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
