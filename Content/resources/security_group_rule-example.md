### Required resources

```hcl
resource "outscale_security_group" "security_group01" {
	description         = "Terraform target security group for SG rule from IP and SG"
	security_group_name = "terraform-security-group-test-01"
}

resource "outscale_security_group" "security_group02" {
	description         = "Terraform source security group for SG rule from SG"
	security_group_name = "terraform-security-group-test-02"
}
```

### Set an inbound rule from an IP range

```hcl
resource "outscale_security_group_rule" "security_group_rule01" {
	flow              = "Inbound"
	security_group_id = outscale_security_group.security_group01.security_group_id
	from_port_range   = "80"
	to_port_range     = "80"
	ip_protocol       = "tcp"
	ip_range          = "10.0.0.0/16"
}
```

### Set an inbound rule from another security group

```hcl
resource "outscale_security_group_rule" "security_group_rule02" {
	flow              = "Inbound"
	security_group_id = outscale_security_group.security_group01.security_group_id
	rules {
		from_port_range = "22"
		to_port_range   = "22"
		ip_protocol     = "tcp"
		security_groups_members {
			account_id          = "012345678910"
			security_group_name = "terraform-security-group-test-02"
		}
	}
}
```