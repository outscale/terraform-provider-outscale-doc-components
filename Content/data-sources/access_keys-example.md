```hcl
data "outscale_access_key" "access_keys01" { 
    filter {
        name   = "access_keys_ids"
        values = ["ABCDEFGHIJ0123456789", "0123456789ABCDEFGHIJ"]
    }
}
```