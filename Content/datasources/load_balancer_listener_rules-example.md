```hcl
data "outscale_load_balancer_listener_rules" "rules01" {
  filter {
    name   = "listener_rule_names"
    values = ["terraform-listener-rule02","terraform-listener-rule01"]
  }
}
```