### Create a load balancer policy based on browser

```hcl
resource "outscale_load_balancer" "load_balancer01" {
  load_balancer_name = "terraform-load-balancer-for-browser-policy"
  subregion_names    = ["eu-west-2a"]
  listeners {
      backend_port           = 8080
      backend_protocol       = "HTTP"  
      load_balancer_port     = 8080
      load_balancer_protocol = "HTTP"
  }
}

resource "outscale_load_balancer_policy" "load_balancer_policy01" {
  load_balancer_name = "terraform-load-balancer-for-browser-policy"
  policy_name        = "terraform-load-balancer-browser-policy"
  policy_type        = "load_balancer"
}
```

### Create a load balancer policy based on application cookie

```hcl
resource "outscale_load_balancer" "load_balancer02" {
  load_balancer_name = "terraform-load-balancer-for-app-policy"
  subregion_names    = ["${var.region}b"]
  listeners {
      load_balancer_port     = 80
      load_balancer_protocol = "TCP"
      backend_port           = 80
      backend_protocol       = "TCP"
  }
}

resource "outscale_load_balancer_policy" "load_balancer_policy02" {
  load_balancer_name = outscale_load_balancer.load_balancer02.load_balancer_name
  policy_name        = "terraform-load-balancer-app-policy"
  policy_type        = "app"
  cookie_name        = "cookie01"
  depends_on         = [outscale_load_balancer.load_balancer02]
}
```