```hcl
data "outscale_vpn_connections" "vpn_connections01" {
	filter {
		name   = "client_gateway_ids"
		values = ["cgw-12345678"]
	}
	filter {
		name   = "virtual_gateway_ids"
		values = ["vgw-12345678", "vgw-12345678"]
	}
}
```