```
data "outscale_flexible_gpu" "flexible_gpu01" {
  filter {
    name   = "flexible_gpu_ids"
    values = ["fgpu-12345678"]
  }
}
```