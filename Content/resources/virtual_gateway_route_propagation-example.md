#resource "outscale_virtual_gateway" "virtual_gateway01" {
#    connection_type = "ipsec.1"
#}

#resource "outscale_net" "net01" {
#    ip_range = "10.0.0.0/16"
#}

#resource "outscale_route_table" "route_table01" {
#    net_id = outscale_net.net01.net_id
#}

#resource "outscale_virtual_gateway_link" "virtual_gateway_link01" {
#    virtual_gateway_id = outscale_virtual_gateway.virtual_gateway01.virtual_gateway_id
#    net_id             = outscale_net.net01.net_id
#}

resource "outscale_virtual_gateway_route_propagation" "virtual_gateway_route_propagation01" {
    enable             = true
    virtual_gateway_id = outscale_virtual_gateway.virtual_gateway01.virtual_gateway_id
    route_table_id     = outscale_route_table.route_table01.route_table_id
    depends_on         = [outscale_virtual_gateway_link.virtual_gateway_link01]
}