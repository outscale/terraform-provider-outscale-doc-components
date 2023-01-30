```hcl
data "outscale_vm" "vm01" {
    filter {
        name   = "vm_ids"
        values = ["i-12345678"]
    }
}
```