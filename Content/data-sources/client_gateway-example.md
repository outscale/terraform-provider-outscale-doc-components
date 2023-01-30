```hcl
data "outscale_client_gateway" "client_gateway01" {
    filter {
        name   = "client_gateway_ids"
        values = ["cgw-12345678"]
    }
}
```