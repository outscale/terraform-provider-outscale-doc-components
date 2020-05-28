data "outscale_vpn_connection" "data_vpn_connection" {
	filter {
		name   = "vpn_connection_id"
		values = ["vgw-12345678"]
	}
}