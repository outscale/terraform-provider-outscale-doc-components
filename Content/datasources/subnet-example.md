```hcl
data "outscale_subnet" "subnet01" {
  filter {
    name   = "net_ids"
    values = ["vpc-12345678"]
  }
}
```