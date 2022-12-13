### Required resources

```hcl
resource "outscale_vm" "vm01" {
    image_id                 = ami-12345678
    vm_type                  = t2.small
    keypair_name             = var.keypair_name
    placement_subregion_name = "eu-west-2a"
}
resource "outscale_flexible_gpu" "flexible_gpu01" {
    model_name            = var.model_name
    generation            = "v4"
    subregion_name        = "eu-west-2a"
    delete_on_vm_deletion = true
}
```

### Create a flexible GPU link

```hcl
resource "outscale_flexible_gpu_link" "link_fgpu01" {
    flexible_gpu_id = outscale_flexible_gpu.flexible_gpu01.flexible_gpu_id
    vm_id           = outscale_vm.vm01.vm_id
}
```