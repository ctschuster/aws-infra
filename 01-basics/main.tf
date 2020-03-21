########################################################################
# 01-basics/main.tf
########################################################################

terraform {
  required_version = ">=0.12.23"

  required_providers {
    aws            = "~>2.27.0"
  }

  backend "s3" {
    region         = "us-east-1"
    # NOTE:  <account-alias> cannot be supplied via var.account_alias
    dynamodb_table = "<account-alias>-dynamodb"
    bucket         = "<account-alias>-tfstate"
    key            = "basics.tfstate"
    encrypt        = true
  }
}


provider "aws" {
  region           = "us-east-1"
}
