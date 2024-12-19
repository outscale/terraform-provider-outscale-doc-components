### Get your own access keys (root account or user)

```hcl
data "outscale_access_keys" "access_keys01" { 
    filter {
        name   = "access_key_ids"
        values = ["ABCDEFGHIJ0123456789", "0123456789ABCDEFGHIJ"]
    }
}
```

### Get the access keys of another user

```hcl
data "outscale_access_keys" "access_keys" {
    user_name  = "user_name"
    filter {
        name   = "access_key_ids"
        values = ["XXXXXXXXX","YYYYYYYYYY"]
    }
    filter {
        name   = "states"
        values = ["ACTIVE"]
    }
}
```