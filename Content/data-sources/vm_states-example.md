```hcl
data "outscale_vm_states" "vm_states01" {
    filter {
        name   = "vm_ids"
        values = ["i-12345678", "i-87654321"]
    }
    filter {
        name   = "vm_states"
        values = ["running"]
    }
}
```
