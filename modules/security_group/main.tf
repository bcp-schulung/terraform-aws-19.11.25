resource "aws_security_group" "security_group" {
  name       = var.name
  vpc_id     = var.vpc_id

  tags = {
    Name = var.name
  }
}

resource "aws_vpc_security_group_ingress_rule" "ingress_rules" {
    for_each = { for idx, rule in var.ingress_rules : idx => rule }
    
    security_group_id = aws_security_group.security_group.id
    from_port         = each.value.protocol == "-1" ? null : each.value.from_port
    to_port           = each.value.protocol == "-1" ? null : each.value.to_port
    ip_protocol       = each.value.protocol
    cidr_ipv4         = each.value.cidr_ipv4
}

resource "aws_vpc_security_group_egress_rule" "egress_rules" {
    for_each = { for idx, rule in var.egress_rules : idx => rule }
    
    security_group_id = aws_security_group.security_group.id
    from_port         = each.value.protocol == "-1" ? null : each.value.from_port
    to_port           = each.value.protocol == "-1" ? null : each.value.to_port
    ip_protocol       = each.value.protocol
    cidr_ipv4         = each.value.cidr_ipv4
}