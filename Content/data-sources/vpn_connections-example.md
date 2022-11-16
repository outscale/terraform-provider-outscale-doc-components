```hcl
data "outscale_vpn_connections" "data_vpn_connections" {
	filter {
		name   = "vpn_connection_ids"
		values = ["vpn-12345678","vpn-87654321"]
	}
}
```