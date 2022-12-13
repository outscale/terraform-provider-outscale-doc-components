```hcl
data "outscale_net" "net01" {
    filter {
        name   = "net_ids"
        values = ["vpc-12345678"]
    }
}
```