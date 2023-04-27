```hcl
data "outscale_vm_state" "vm_state01" {
    all_vms    = true
    filter {
        name   = "vm_ids"
        values = ["i-12345678"]
    }
}
```