```hcl
data "outscale_quota" "load_balancer_listeners_quota01" {
  filter {
    name   = "collections"
    values = ["LBU"]
  }
  filter {
    name   = "quota_names"
    values = ["lb_listeners_limit"]
  }
  filter {
    name   = "quota_types"
    values = ["global"]
  }
  filter {
    name   = "short_descriptions"
    values = ["Load Balancer Listeners Limit"]
  }
}
```