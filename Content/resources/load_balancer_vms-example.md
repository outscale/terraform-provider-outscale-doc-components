### Required resources

```hcl
resource "outscale_vm" "outscale_vm01" {
    image_id     = "ami-12345678"
    vm_type      = "tinav5.c1r1p2"
    keypair_name = var.keypair_name
}

resource "outscale_vm" "outscale_vm02" {
    image_id     = var.image_id
    vm_type      = var.vm_type
    keypair_name = var.keypair_name
}

resource "outscale_load_balancer" "load_balancer01" {
    load_balancer_name = "load-balancer-for-backend-vms"
    subregion_names    = ["${var.region}a"]
    listeners {
        backend_port           = 80
        backend_protocol       = "TCP"
        load_balancer_protocol = "TCP"
        load_balancer_port     = 80
    }
    tags {
        key   = "name"
        value = "outscale_load_balancer01"
    }
}
```

### Register VMs with a load balancer

```hcl
resource "outscale_load_balancer_vms" "outscale_load_balancer_vms01" {
    load_balancer_name = "load-balancer-for-backend-vms"
    backend_vm_ids     = [outscale_vm.outscale_vm01.vm_id,outscale_vm.outscale_vm_02.vm_id]
}
```

### Register IPs with a load balancer

```hcl
resource "outscale_load_balancer_vms" "outscale_load_balancer_vms01" {
    load_balancer_name = "load-balancer-for-backend-vms"
    backend_ips        = [outscale_vm.outscale_vm01.public_ip, outscale_vm.outscale_vm02.public_ip]
}
```