```hcl
data "outscale_load_balancer_vm_health" "load_balancer_vm_health01" {
    load_balancer_name = "load_balancer01"
    backend_vm_ids     = ["i-12345678","i-87654321"]
}
```