```hcl
data "outscale_route_tables" "route_tables01" {
    filter {
        name   = "net_ids"
        values = ["vpc-12345678", "vpc-87654321"]
    }
    filter {
        name   = "link_route_table_main"
        values = ["true"]
    }
}
```