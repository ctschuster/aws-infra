########################################################################
# essentials/cloudtrail.tf
########################################################################

resource "aws_cloudtrail" "main" {
  name                          = "trail2logs"
  s3_bucket_name                = aws_s3_bucket.logs.id
  s3_key_prefix                 = "trail"
  include_global_service_events = false
}
