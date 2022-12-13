```hcl
data "outscale_route_tables" "route_tables01" {
    filter {
        name   = "route_table_ids"
        values = ["rtb-12345678", "rtb-12345679"]
    }
}
```