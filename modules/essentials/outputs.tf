########################################################################
# essentials/outputs.tf
########################################################################

output "log_bucket_name" {
  value = aws_s3_bucket.logs.id
}
