```hcl
data "outscale_volumes" "outscale_volumes01" {
  filter {
    name   = "volume_ids"
    values = ["vol-12345678", "vol-12345679"]
  }
}
```