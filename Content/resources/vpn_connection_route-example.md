#resource "outscale_vpn_connection" "vpn_connection01" {
#    client_gateway_id  = "cgw-12345678"
#    virtual_gateway_id = "vgw-12345678"
#    connection_type    = "ipsec.1"
#    static_routes_only = false
#}

resource "outscale_vpn_connection_route" "vpn_connection_route01" {
		vpn_connection_id    = outscale_vpn_connection.vpn_connection01.vpn_connection_id
		destination_ip_range = "10.0.0.0/0"

}