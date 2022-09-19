```hcl
data "outscale_nat_services" "nat_services01" {
  filter {
    name   = "nat_service_ids"
    values = ["nat-12345678", "nat-12345679"]
  }
}
```