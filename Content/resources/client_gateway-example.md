resource "outscale_client_gateway" "client_gateway_01" {
    bgp_asn         = 00
    public_ip       = "111.11.11.111"
    connection_type = "ipsec.1"
    tags {
        key   = "Name"
        value = "client_gateway_01"
        }
}