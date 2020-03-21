########################################################################
# essentials/locals.tf
########################################################################

locals {
  aws_region            = "us-east-1"

  tfstate_lock_dynamodb = "${var.account_alias}-dynamodb"
  bucket_name_tfstate   = "${var.account_alias}-tfstate"
  bucket_name_log       = "${var.account_alias}-logs"
}
