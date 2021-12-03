### Required resources

```hcl
resource "outscale_client_gateway" "client_gateway01" {
	bgp_asn         = 65000
	public_ip       = "111.11.11.111"
	connection_type = "ipsec.1"
}

resource "outscale_virtual_gateway" "virtual_gateway01" {
	connection_type = "ipsec.1"
}

resource "outscale_vpn_connection" "vpn_connection01" {
	client_gateway_id  = outscale_client_gateway.client_gateway01.client_gateway_id
	virtual_gateway_id = outscale_virtual_gateway.virtual_gateway01.virtual_gateway_id
	connection_type    = "ipsec.1"
	static_routes_only = true
}
```

### Create a static route to a VPN connection

```hcl
resource "outscale_vpn_connection_route" "vpn_connection_route01" {
	vpn_connection_id    = outscale_vpn_connection.vpn_connection01.vpn_connection_id
	destination_ip_range = "10.0.0.0/16"
}
```