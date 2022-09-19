```hcl
data "outscale_load_balancers" "load_balancers01" {
    filter {
        name   = "load_balancer_names"
        values = ["load_balancer01","load_balancer02"]
    }
}
```