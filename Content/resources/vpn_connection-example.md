resource "outscale_vpn_connection" "vpn_connection01" {
		client_gateway_id  = "cgw-12345678"
		virtual_gateway_id = "vgw-87654321"
		connection_type    = "ipsec.1"
		static_routes_only = true
		tags {
			key   = "Name"
			value = "vpn01"
			}
}