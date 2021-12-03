### Required resources

```hcl
resource "outscale_net" "net01" {
	ip_range = "10.0.0.0/16"
}

resource "outscale_subnet" "subnet01" {
	net_id   = outscale_net.net01.net_id
	ip_range = "10.0.0.0/18"
}

resource "outscale_route_table" "route_table01" {
	net_id = outscale_net.net01.net_id
}
```

### Link a route table to a subnet

```hcl
resource "outscale_route_table_link" "route_table_link01" {
	subnet_id      = outscale_subnet.subnet01.subnet_id
	route_table_id = outscale_route_table.route_table01.route_table_id
}
```