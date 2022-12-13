```hcl
data "outscale_virtual_gateways" "virtual_gateways01" {
    filter {
        name   = "virtual_gateway_ids"
        values = ["vgw-12345678", "vgw-87654321"]
    }
}
```