### Create a flexible GPU

```hcl
resource "outscale_flexible_gpu" "flexible_gpu01" {
    model_name             =  var.model_name
    generation             =  "v4"
    subregion_name         =  "${var.region}a"
    delete_on_vm_deletion  =  true
}
```