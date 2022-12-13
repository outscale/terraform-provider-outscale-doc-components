```hcl
data "outscale_vm_states" "vm_states01" {
    filter {
        name   = "vm_ids"
        values = ["i-12345678", "i-12345679"]
    }
}
```
