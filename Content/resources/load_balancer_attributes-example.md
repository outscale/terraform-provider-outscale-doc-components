### Required resource

```hcl
resource "outscale_load_balancer" "load_balancer01" {
  load_balancer_name         = "terraform-load-balancer"
  subregion_names            = ["eu-west-2a"]
  listeners {
      backend_port           = 80
      backend_protocol       = "HTTP"
      load_balancer_protocol = "HTTP"
      load_balancer_port     = 80
  }
  listeners {
      backend_port           = 8080
      backend_protocol       = "HTTPS"
      load_balancer_protocol = "HTTPS"
      load_balancer_port     = 8080
      server_certificate_id  = "arn:aws:iam::012345678910:server-certificate/MyCertificates/Certificate"
  }
  listeners {
      backend_port           = 1024
      backend_protocol       = "TCP"
      load_balancer_protocol = "TCP"
      load_balancer_port     = 1024
  }
  tags {
      key   = "name"
      value = "terraform-load-balancer"
  }
  tags {
      key   = "platform"
      value = "eu-west-2"
  }
}
```

### Update health check

```hcl
resource "outscale_load_balancer_attributes" "attributes01" {
   load_balancer_name = outscale_load_balancer.load_balancer01.id
   health_check  {
      healthy_threshold   = 10
      check_interval      = 30
      path                = "/index.html"
      port                = 8080
      protocol            = "HTTPS"
      timeout             = 5
      unhealthy_threshold = 5
   }
}
```

### Update access log

```hcl
resource "outscale_load_balancer_attributes" "attributes02" {
  load_balancer_name = outscale_load_balancer.load_balancer01.id
  access_log {
      publication_interval = 5
      is_enabled           = true
      osu_bucket_name      = "terraform-access-logs"
      osu_bucket_prefix    = "access-logs-01234"
  }
}
```

### Update policies

```hcl
resource "outscale_load_balancer_attributes" "attributes03" {
  load_balancer_name = outscale_load_balancer.load_balancer01.id
  load_balancer_port = 80
  policy_names       = ["policy-name-01"]
}
```

### Update SSL certificate

```hcl
resource "outscale_load_balancer_attributes" "attributes04" {
  load_balancer_name    = outscale_load_balancer.load_balancer01.id
  load_balancer_port    = 8080
  server_certificate_id = "arn:aws:iam::012345678910:server-certificate/MyCertificates/Certificate"
}
```