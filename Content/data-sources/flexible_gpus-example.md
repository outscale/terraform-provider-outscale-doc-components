```hcl
data "outscale_flexible_gpus" "flexible_gpus01" {
    filter {
        name   = "model_names"
        values = ["nvidia-p6", "nvidia-p100"]
    }
    filter {
        name   = "states"
        values = ["attached"]
    }
}
```