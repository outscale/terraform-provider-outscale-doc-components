### Required resource

```hcl
resource "outscale_net" "net01" {
	ip_range = "10.0.0.0/16"
}
```

### Associate a DHCP option set to a Net

```hcl
resource "outscale_net_attributes" "net_attributes01" {
	net_id              = outscale_net.net01.net_id
	dhcp_options_set_id = var.dhcp_options_set_id
}
```