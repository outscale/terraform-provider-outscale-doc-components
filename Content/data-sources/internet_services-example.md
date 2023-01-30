```hcl
data "outscale_internet_services" "internet_services01" {
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