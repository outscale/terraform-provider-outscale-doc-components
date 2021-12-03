### Required resources

```hcl
resource "outscale_virtual_gateway" "virtual_gateway01" {
	connection_type = "ipsec.1"
}

resource "outscale_net" "net01" {
	ip_range = "10.0.0.0/16"
}
```

### Link a virtual gateway to a Net

```hcl
resource "outscale_virtual_gateway_link" "virtual_gateway_link01" {
	virtual_gateway_id = outscale_virtual_gateway.virtual_gateway01.virtual_gateway_id
	net_id             = outscale_net.net01.net_id
}
```