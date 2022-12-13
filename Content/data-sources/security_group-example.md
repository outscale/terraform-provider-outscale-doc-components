```hcl
data "outscale_security_group" "security_group01" {
    filter {
        name   = "security_group_ids"
        values = ["sg-12345678"]
    }
}
```