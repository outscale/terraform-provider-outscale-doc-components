#resource "outscale_virtual_gateway" "virtual_gateway_1" {
#   connection_type = "ipsec.1"
#}

#resource "outscale_net" "outscale_net" {
#   ip_range = "10.0.0.0/16"
#}

resource "outscale_virtual_gateway_link" "virtual_gateway_link" {
    virtual_gateway_id = outscale_virtual_gateway.virtual_gateway_2.virtual_gateway_id
    net_id             = outscale_net.outscale_net.net_id
    }