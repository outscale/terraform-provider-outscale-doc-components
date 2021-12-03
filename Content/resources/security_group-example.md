### Optional resource

```hcl
resource "outscale_net" "net01" {
	ip_range = "10.0.0.0/16"
}
```

### Create a security group for a Net

```hcl
resource "outscale_security_group" "security_group01" {
	description         = "Terraform security group test"
	security_group_name = "terraform-security-group"
	net_id              = outscale_net.net01.net_id
}
```