```hcl
data "outscale_policies" "user_policies" {
    filter {
        name   = "only_linked"
        values = [true]
    }
    filter {
        name   = "path_prefix"
        values = ["/"]
    }
    filter {
        name   = "scope"
        values = ["LOCAL"]
    }
}
```