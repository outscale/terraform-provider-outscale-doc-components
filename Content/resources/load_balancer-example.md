### Create a load balancer in the public Cloud

```hcl
resource "outscale_load_balancer" "load_balancer01" {
  load_balancer_name = "terraform-public-load-balancer"
  subregion_names    = ["${var.region}a"]
  listeners {
      backend_port           = 8080
      backend_protocol       = "HTTP"
      load_balancer_protocol = "HTTP"
      load_balancer_port     = 8080
  }
  tags {
      key   = "name"
      value = "terraform-public-load-balancer"
  }
}
```

### Create a load balancer in a Net

```hcl
resource "outscale_net" "net01" {
  ip_range = "10.0.0.0/16"
}

resource "outscale_subnet" "subnet01" {
  net_id   = outscale_net.net01.net_id
  ip_range = "10.0.0.0/24"
  tags {
      key   = "Name"
      value = "terraform-subnet-for-internal-load-balancer"
  }
}

resource "outscale_security_group" "security_group01" {
  description         = "Terraform security group for internal load balancer"
  security_group_name = "terraform-security-group-for-internal-load-balancer"
  net_id              = outscale_net.net01.net_id
  tags {
      key   = "Name"
      value = "terraform-security-group-for-internal-load-balancer"
  }
}

resource "outscale_load_balancer" "load_balancer02" {
  load_balancer_name = "terraform-private-load-balancer"
  listeners {
      backend_port           = 80
      backend_protocol       = "TCP"
      load_balancer_protocol = "TCP"
      load_balancer_port     = 80
  }
  subnets            = [outscale_subnet.subnet01.subnet_id]
  security_groups    = [outscale_security_group.security_group01.security_group_id]
  load_balancer_type = "internal"
  tags {
      key   = "name"
      value = "terraform-private-load-balancer"
  }
}
```

### Create an internet-facing load balancer in a Net

```hcl
resource "outscale_net" "net02" {
  ip_range = "10.0.0.0/16"
}

resource "outscale_subnet" "subnet02" {
  net_id   = outscale_net.net02.net_id
  ip_range = "10.0.0.0/24"
  tags {
      key   = "Name"
      value = "terraform-security-group-for-load-balancer"
  }
}

resource "outscale_internet_service" "internet_service01" {
  depends_on = "outscale_net.net02"
}

resource "outscale_internet_service_link" "internet_service_link01" {
  internet_service_id = outscale_internet_service.internet_service01.internet_service_id
  net_id              = outscale_net.net02.net_id
}

resource "outscale_route_table" "route_table01" {
  net_id = outscale_net.net02.net_id
  tags {
      key   = "name"
      value = "terraform-route-table-for-load-balancer"
  }
}

resource "outscale_route" "route01" {
  gateway_id           = outscale_internet_service.internet_service01.id
  destination_ip_range = "10.0.0.0/0"
  route_table_id       = outscale_route_table.route_table01.route_table_id
}

resource "outscale_route_table_link" "route_table_link01" {
  route_table_id = outscale_route_table.route_table01.route_table_id
  subnet_id      = outscale_subnet.subnet02.subnet_id
}

resource "outscale_load_balancer" "load_balancer03" {
  load_balancer_name = "terraform-internet-facing-private-load-balancer"
  listeners {
      backend_port           = 80
      backend_protocol       = "TCP"
      load_balancer_protocol = "TCP"
      load_balancer_port     = 80
  }
  listeners {
      backend_port           = 8080
      backend_protocol       = "HTTP"
      load_balancer_protocol = "HTTP"
      load_balancer_port     = 8080
  }
  subnets            = [outscale_subnet.subnet02.subnet_id]
  load_balancer_type = "internet-facing"
  tags {
      key   = "name"
      value = "terraform-internet-facing-private-load-balancer"
  }
  depends_on = [outscale_route.route01,outscale_route_table_link.route_table_link01]
}
```