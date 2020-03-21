########################################################################
# 01-basics/outputs.tf
########################################################################

output "account_alias" {
  value = var.account_alias
}

output "log_bucket_name" {
  value = module.essentials.log_bucket_name
}
