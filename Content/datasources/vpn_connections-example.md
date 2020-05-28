data "outscale_vpn_connections" "data_vpn_connections" {
	filter {
		name   = "vpn_connection_ids"
		values = ["vgw-12345678","vgw-87654321"]
	}
}