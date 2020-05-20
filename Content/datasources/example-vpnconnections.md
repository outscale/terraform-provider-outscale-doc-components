data "outscale_vpn_connections" "data_vpn_connections" {
	filter {
		name   = "vpn_connection_ids"
		values = [outscale_vpn_connection.vpn_connection01.vpn_connection_id, outscale_vpn_connection.vpn_connection02.vpn_connection_id]
	}
}