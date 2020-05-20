resource "outscale_vpn_connection_route" "vpn_route01" {
		 vpn_connection_id  = outscale_vpn_connection.vpn_connection.vpn_connection_id  = destination_ip_range = "10.0.0.0/0"
}