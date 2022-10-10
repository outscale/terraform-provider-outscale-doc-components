```hcl
data "outscale_ca" "ca01" { 
    filter {
        name   = "ca_ids"
        values = ["ca-12345678"]
    }
}
```