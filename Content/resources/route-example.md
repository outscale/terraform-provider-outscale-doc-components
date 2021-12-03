### Required resources

```hcl
resource "outscale_net" "net01" {
	ip_range = "10.0.0.0/16"
}

resource "outscale_route_table" "route_table01" {
	net_id = outscale_net.net01.net_id
}

resource "outscale_internet_service" "internet_service01" {
}

resource "outscale_internet_service_link" "internet_service_link01" {
	internet_service_id = outscale_internet_service.internet_service01.internet_service_id
	net_id              = outscale_net.net01.net_id
}
```

### Create a route to an Internet service

```hcl
resource "outscale_route" "route01" {
	gateway_id           = outscale_internet_service.internet_service01.internet_service_id
	destination_ip_range = "0.0.0.0/0"
	route_table_id       = outscale_route_table.route_table01.route_table_id
}
```