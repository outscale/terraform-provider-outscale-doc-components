### Required resource

```hcl
resource "outscale_net" "net01" {
	ip_range = "10.0.0.0/16"
}
```

### Create a route table

```hcl
resource "outscale_route_table" "route_table01" {
	net_id = outscale_net.net01.net_id
}
```