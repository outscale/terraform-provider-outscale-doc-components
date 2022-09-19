```hcl
data "outscale_vms" "vms_01" {
  filter {
    name   = "vm_ids"
    values = ["i-12345678", "i-12345679"]
  }
}
```