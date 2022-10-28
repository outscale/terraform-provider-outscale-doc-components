### Optional resource

```hcl
resource "outscale_net" "net01" {
	ip_range = "10.0.0.0/16"
}
```

### Create a security group for a Net

```hcl
resource "outscale_security_group" "security_group01" {
	description         = "Terraform security group"
	security_group_name = "terraform-security-group"
	net_id              = outscale_net.net01.net_id
}
```

### Create a security group for a Net without the default outbound rule 

```hcl
resource "outscale_security_group" "security_group02" {
    remove_default_outbound_rule = true
    description                  = "Terraform security group without outbound rule"
    security_group_name          = "terraform-security-group-empty"
    net_id                       = outscale_net.net01.net_id
}
```