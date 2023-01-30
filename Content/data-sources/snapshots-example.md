```hcl
data "outscale_snapshots" "snapshots01" {
    filter {
        name   = "tag_keys"
        values = ["env"]
    }
    filter {
        name   = "tag_values"
        values = ["prod", "test"]
    }
}
```