data "outscale_load_balancer_listener_rule" "rule01" {
  filter {
    name   = "listener_rule_names"
    values = ["terraform-listener-rule02"]
  }
}