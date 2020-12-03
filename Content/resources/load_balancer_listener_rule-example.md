#resource "outscale_vm" "vm01" {
#  image_id     = var.image_id
#  vm_type      = var.vm_type
#  keypair_name = var.keypair_name
#}

#resource "outscale_load_balancer" "load_balancer01" {
#  load_balancer_name = "terraform-public-load-balancer"
#  subregion_names    = ["${var.region}a"]
#  listeners {
#    backend_port           = 80
#    backend_protocol       = "TCP"
#    load_balancer_protocol = "TCP"
#    load_balancer_port     = 80
#  }
#  tags {
#    key   = "name"
#    value = "terraform-public-load-balancer"
#   }
#}

#resource "outscale_load_balancer_vms" "outscale_load_balancer_vms01" {
#  load_balancer_name = outscale_load_balancer.load_balancer01.id
#  backend_vm_ids     = [outscale_vm.vm01.vm_id]
#}

# Create a listener rule based on path pattern

resource "outscale_load_balancer_listener_rule" "rule01" {
  listener {
    load_balancer_name = outscale_load_balancer.load_balancer01.id
    load_balancer_port = 80
  }
  listener_rule {
    action             = "forward"
    listener_rule_name = "terraform-listener-rule01"
    path_pattern       = "*.abc.*.abc.*.com"
    priority           = 10
  }
  vm_ids = [outscale_vm.vm01.vm_id]
}

# Create a listener rule based on host pattern

resource "outscale_load_balancer_listener_rule" "rule02" {
  listener  {
    load_balancer_name = outscale_load_balancer.load_balancer01.id
    load_balancer_port = 80
  }
  listener_rule {
    action             = "forward"
    listener_rule_name = "terraform-listener-rule02"
    host_name_pattern  = "*.abc.-.abc.*.com"
    priority           = 1
  }
  vm_ids = [outscale_vm.vm01.vm_id]
}