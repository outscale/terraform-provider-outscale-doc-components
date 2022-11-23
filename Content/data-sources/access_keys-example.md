```hcl
data "outscale_access_keys" "access_keys01" { 
    filter {
        name   = "access_key_ids"
        values = ["ABCDEFGHIJ0123456789", "0123456789ABCDEFGHIJ"]
    }
}
```