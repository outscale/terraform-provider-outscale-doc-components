```hcl
data "outscale_nics" "nics01" {
    filter {
        name   = "nic_ids"
        values = ["eni-12345678", "eni-87654321"]
    }
    filter {
        name   = "link_nic_vm_ids"
        values = ["i-12345678"]
    }
}
```