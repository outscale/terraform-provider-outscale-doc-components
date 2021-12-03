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

resource "outscale_route_table_link" "outscale_route_table_link01" {
    subnet_id      = outscale_subnet.subnet01.subnet_id
    route_table_id = outscale_route_table.route_table01.route_table_id
}

resource "outscale_internet_service" "internet_service01" {
}

resource "outscale_internet_service_link" "internet_service_link01" {
    net_id              = outscale_net.net01.net_id
    internet_service_id = outscale_internet_service.internet_service01.internet_service_id
}

resource "outscale_route" "route01" {
    destination_ip_range = "0.0.0.0/0"
    gateway_id           = outscale_internet_service.internet_service01.internet_service_id
    route_table_id       = outscale_route_table.route_table01.route_table_id
    depends_on           = [outscale_internet_service_link.internet_service_link01]
}

resource "outscale_public_ip" "public_ip01" {
}
```

### Create a NAT service

```hcl
resource "outscale_nat_service" "nat_service01" {
    subnet_id    = outscale_subnet.subnet01.subnet_id
    public_ip_id = outscale_public_ip.public_ip01.public_ip_id
    depends_on   = [outscale_route.route01]
}
```