# Set rule from IP range

resource "outscale_security_group" "security_group01" {
  description         = "Terraform security group for rule"
  security_group_name = "terraform-security-group-test-01"
}

resource "outscale_security_group_rule" "security_group_rule01" {
  flow              = "Inbound"
  security_group_id = outscale_security_group.security_group01.security_group_id
  from_port_range   = "80"
  to_port_range     = "80"
  ip_protocol       = "tcp"
  ip_range          = "10.0.0.0/16"
}

# Set rule from another security group

resource "outscale_security_group" "security_group02" {
    description         = "test group"
    security_group_name = "sg1-terraform-test"
    tags {
        key   = "Name"
        value = "outscale_sg"
    }
}

resource "outscale_security_group" "security_group03" {
    description         = "test group"
    security_group_name = "sg2-terraform-test"
    tags {
        key   = "Name"
        value = "outscale_sg2"
    }
}

resource "outscale_security_group_rule" "security_group_rule02" 
     flow              = "Inbound"
    security_group_id = outscale_security_group.security_group02.security_group_id
    rules {
     from_port_range   = "22"
     to_port_range     = "22"
     ip_protocol       = "tcp"
      security_groups_members {
           account_id =  "012345678910"
           security_group_name = outscale_security_group.security_group02.security_group_name
       }
     }