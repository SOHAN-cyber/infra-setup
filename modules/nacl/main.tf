resource "aws_network_acl" "network_acl" {
  vpc_id = var.vpc_id
  subnet_ids = var.subnet_ids
  tags = merge(
    {
    Name = format("%s-nacl", var.name)
  },
    var.tags,
  )
}
/*-------------------------------------------------------*/
resource "aws_network_acl_rule" "network_acl_egress_rule" {
  count          = length(var.nacl_egress_to_port)
  network_acl_id = aws_network_acl.network_acl.id
  rule_number    = var.nacl_egress_rule_no+count.index
  egress         = true
  protocol       = var.nacl_egress_protocol
  rule_action    = var.nacl_egress_action
  cidr_block     = var.nacl_cidr_block
  from_port      = element(var.nacl_egress_from_port,count.index)
  to_port        = element(var.nacl_egress_to_port,count.index)
}
/*-------------------------------------------------------*/
resource "aws_network_acl_rule" "network_acl_ingress_rule" {
  count          = length(var.nacl_ingress_to_port)
  network_acl_id = aws_network_acl.network_acl.id
  rule_number    = var.nacl_ingress_rule_no+count.index
  egress         = false
  protocol       = var.nacl_ingress_protocol
  rule_action    = var.nacl_ingress_action
  cidr_block     = var.nacl_cidr_block
  from_port      = element(var.nacl_ingress_from_port,count.index)
  to_port        = element(var.nacl_ingress_to_port,count.index)
}

