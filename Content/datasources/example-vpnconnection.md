data "outscale_vpn_connection" "data_vpn_connection" {
	filter {
		name   = "vpn_connection_id"
		values = [outscale_vpn_connection.vpn_connection01.vpn_connection_id]
	}
}