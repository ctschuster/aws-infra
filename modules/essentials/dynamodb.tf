########################################################################
# essentials/dynamodb.tf
########################################################################

resource "aws_dynamodb_table" "lock-table" {
  name           = local.tfstate_lock_dynamodb
  hash_key       = "LockID"

  read_capacity  = 3
  write_capacity = 3

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = local.tfstate_lock_dynamodb
  }
}
