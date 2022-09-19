```hcl
data "outscale_access_key" "access_key01" { 
    filter {
        name   = "access_key_ids"
        values = ["ABCDEFGHIJ0123456789"]
    }
}
```