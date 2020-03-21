########################################################################
# network/variables.tf
########################################################################

variable "aws_region" {
  description = "AWS region; e.g. us-east-1"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR for the VPC; e.g. 10.0.0.0/22"
  type        = string
}
