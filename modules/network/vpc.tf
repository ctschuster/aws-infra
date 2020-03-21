########################################################################
# network/vpc.tf
########################################################################

##### VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
}

##### Public Subnets
resource "aws_subnet" "pub" {
  count             = local.az_count
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 4, count.index)
  availability_zone = element(local.az_list, count.index)
}

##### Private Subnets
resource "aws_subnet" "priv" {
  count             = local.az_count
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 2, 1+count.index)
  availability_zone = element(local.az_list, count.index)
}

##### IGW
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
}

##### VPC endpoints
resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.main.id
  service_name = "com.amazonaws.${var.aws_region}.s3"
}
