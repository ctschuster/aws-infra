########################################################################
# network/outputs.tf
########################################################################

output "availability_zones" {
  value = local.az_list.*
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "pub_subnet_ids" {
  value = aws_subnet.pub.*.id
}

output "priv_subnet_ids" {
  value = aws_subnet.priv.*.id
}
