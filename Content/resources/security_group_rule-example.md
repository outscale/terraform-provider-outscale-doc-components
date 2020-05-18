#resource "outscale_security_group" "security_group01" {
#  description         = "Terraform security group for rule"
#  security_group_name = "terraform-security-group-test-01"
#}

resource "outscale_security_group_rule" "security_group_rule01" {
  flow              = "Inbound"
  security_group_id = outscale_security_group.security_group01.id
  from_port_range   = "80"
  to_port_range     = "80"
  ip_protocol       = "tcp"
  ip_range          = "10.0.0.0/16"
}