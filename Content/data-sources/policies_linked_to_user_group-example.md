```hcl
data "outscale_policies_linked_to_user_group" "managed_policies_linked_to_user_group" {
    user_group_name = "user_group_name"
    filter {
        name   = "user_group_ids"
        values = ["XXXXXXX","YYYYYY"]
    }
    filter {
        name   = "path_prefix"
        values = ["/test/"]
    }
}
```