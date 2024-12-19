```hcl
data "outscale_user" "user01" {
    filter {
        name   = "user_ids"
        values = ["XXXXXXXXXXXXXXXX"]
    }
}
```