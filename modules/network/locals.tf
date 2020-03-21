########################################################################
# network/locals.tf
########################################################################

locals {
  open_cidr      = "0.0.0.0/0"
  open_cidr_ipv6 = "::/0"
  az_count       = 3
  az_list        = [
    "${var.aws_region}a",
    "${var.aws_region}b",
    "${var.aws_region}c",
  ]

  standard_port  = {
    ssh    =   22
    mysql  = 3306
    http   =   80
    https  =  443
  }
}
