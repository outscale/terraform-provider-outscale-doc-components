```hcl
data "outscale_load_balancer" "load_balancer01" {
    filter {
        name   = "load_balancer_names"
        values = "load_balancer01"
    }
}
```