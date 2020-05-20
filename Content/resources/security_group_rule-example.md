#resource "outscale_security_group" "security_group01" {
#  description         = "Terraform security group for rule"
#  security_group_name = "terraform-security-group-test-01"
#}

resource "outscale_security_group_rule" "outscale_security_group_rule-3" 
  flow              = "Inbound"
  security_group_id = outscale_security_group.outscale_security_group.id
  rules {
    from_port_range   = "22"
    to_port_range     = "22"
    ip_protocol       = "tcp"
    security_groups_members {
        account_id          =  "012345678910"
        security_group_name = outscale_security_group.outscale_security_group2.security_group_name
       }
     }