```hcl
data "outscale_nics" "nics01" {
  filter {
    name   = "nic_ids"
    values = ["eni-12345678", "eni-12345679"]
  }
}
```