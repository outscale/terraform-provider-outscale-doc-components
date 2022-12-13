```hcl
data "outscale_flexible_gpus" "flexible_gpus01" {
    filter {
        name   = "fgpu_ids"
        values = ["fgpu-12345678", "fgpu-12345679"]
    }
}
```