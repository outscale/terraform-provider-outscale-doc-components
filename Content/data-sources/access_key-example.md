### Get one of your own access keys (root account or user)

```hcl
data "outscale_access_key" "access_key01" { 
    filter {
        name   = "access_key_ids"
        values = ["ABCDEFGHIJ0123456789"]
    }
}
```

### Get the access key of another user

```hcl
data "outscale_access_key" "access_key01" {
    user_name = "user_name"
    filter {
        name   = "access_key_ids"
        values = ["XXXXXXXXX"]
    }
    filter {
        name   = "states"
        values = ["ACTIVE"]
    }
}
```