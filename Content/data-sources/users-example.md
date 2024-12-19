```hcl
data "outscale_users" "users-2" {
    filter {
        name   = "user_ids"
        values = ["XXXXXXXXXXXXXXXX","YYYYYYYYYY"]
    }
}
```