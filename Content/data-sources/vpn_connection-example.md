```hcl
data "outscale_vpn_connection" "data_vpn_connection" {
	filter {
		name   = "vpn_connection_ids"
		values = ["vpn-12345678"]
	}
}
```