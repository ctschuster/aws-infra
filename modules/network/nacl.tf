########################################################################
# network/nacl.tf
########################################################################

resource "aws_network_acl" "main" {
  vpc_id = aws_vpc.main.id

  ingress {
    protocol   = "tcp"
    rule_no    = 101
    action     = "allow"
    cidr_block = local.open_cidr
    from_port  = local.standard_port["http"]
    to_port    = local.standard_port["http"]
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 102
    action     = "allow"
    cidr_block = local.open_cidr
    from_port  = local.standard_port["https"]
    to_port    = local.standard_port["https"]
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 111
    action     = "allow"
    cidr_block = local.open_cidr
    from_port  = local.standard_port["ssh"]
    to_port    = local.standard_port["ssh"]
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 112
    action     = "allow"
    cidr_block = local.open_cidr
    from_port  = local.standard_port["mysql"]
    to_port    = local.standard_port["mysql"]
  }

  egress {
    protocol   = "tcp"
    rule_no    = 201
    action     = "allow"
    cidr_block = local.open_cidr
    from_port  = 0
    to_port    = 65535
  }
}
