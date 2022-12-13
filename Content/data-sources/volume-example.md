```hcl
data "outscale_volume" "outscale_volume01" {
    filter {
        name   = "volume_ids"
        values = ["vol-12345678"]
    }
}
```