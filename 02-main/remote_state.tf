########################################################################
# 02-main/remote_state.tf
########################################################################

data "terraform_remote_state" "basics" {
  backend = "s3"
  config = {
    dynamodb_table = "<account-alias>-dynamodb"
    bucket         = "<account-alias>-tfstate"
    key            = "basics.tfstate"
    region         = "us-east-1"
  }
}
