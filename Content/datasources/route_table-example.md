```hcl
data "outscale_route_table" "route_table01" {
  filter {
    name   = "route_table_ids"
    values = ["rtb-12345678"]
  }
}
```