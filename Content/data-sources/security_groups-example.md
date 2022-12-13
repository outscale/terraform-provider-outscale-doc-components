```hcl
data "outscale_security_groups" "security_groups01" {
    filter {
        name   = "security_group_ids"
        values = ["sg-12345678", "sg-12345679"]
    }
}
```