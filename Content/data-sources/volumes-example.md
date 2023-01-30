```hcl
data "outscale_volumes" "outscale_volumes01" {
    filter {
        name   = "volume_states"
        values = ["in-use"]
    }
    filter {
        name   = "volume_types"
        values = ["gp2", "io1"]
    }
}
```