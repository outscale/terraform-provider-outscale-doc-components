```hcl
resource "outscale_client_gateway" "client_gateway01" {
    bgp_asn         = 65000
    public_ip       = "111.11.11.111"
    connection_type = "ipsec.1"
    tags {
        key   = "Name"
        value = "client_gateway_01"
        }
}
```