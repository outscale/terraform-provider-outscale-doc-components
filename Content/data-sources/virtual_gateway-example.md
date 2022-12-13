```hcl
data "outscale_virtual_gateway" "virtual_gateway01" {
    filter {
        name   = "virtual_gateway_ids"
        values = ["vgw-12345678"]
    }
}
```