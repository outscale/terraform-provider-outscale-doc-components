```hcl
data "outscale_internet_services" "internet_services01" {
  filter {
    name   = "internet_service_ids"
    values = ["igw-12345678", "igw-12345679"]
  }
}
```