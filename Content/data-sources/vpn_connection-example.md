```hcl
data "outscale_vpn_connection" "vpn_connection01" {
	filter {
		name   = "vpn_connection_ids"
		values = ["vpn-12345678"]
	}
}
```