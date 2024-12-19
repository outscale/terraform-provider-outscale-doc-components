```hcl
data "outscale_user_groups" "usegroups01" {
    filter {
        name   = "user_group_ids"
        values = ["XXXXXXXXX","YYYYYYYYYY"]
    }
    filter {
        name   = "path_prefix"
        values = ["/"]
    }
}
```