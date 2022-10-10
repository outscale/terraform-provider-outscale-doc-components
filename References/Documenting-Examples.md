# Documenting Examples

The file must be added to either the `Content/data-sources` or the `Content/resources` folder and be named *object_name-example.md*, for example *load_balancer_attributes-example.md*.

## Style Guide

For an illustration of the following rules, see the [Example](#example-for-the-load_balancer_listener_rule-resource) section below.

### Global

- At a minimum, document required parameters.
- List all resources necessary to manage the documented resource in a `Required resources` section.
- Give a clear and detailed title for each use case.

  | ✅                                 | 🚫                     |
  |-----------------------------------|-----------------------|
  | Create a Net                      | Create a VPC          |
  | Update DHCP Options               | Updating DHCP Options |
  | Link a volume to a VM             | Create a volume_link  |
  | Create a security group rule from an IP range | Create a SG rule 1    |
- When necessary, comment any useful information inside code blocks using the hash symbol (`#`).
- When necessary, document more complex examples.

### Formatting

- Add a line break between each resource.
- Add a 4-space tabulation for each level of indentation.
- Align equal signs according to the longest parameter name in a same level of indentation.
- Add a space character between the values of an array.
- Name a resource based on its Terraform name, followed by the incremented number of occurrences in the example section (e.g., `load_balancer03`).

### Attribute References

You can reference attribute values instead of plaintext values using the following structure:  
`outscale_RESOURCE_TYPE.RESOURCE_NAME.RESOURCE_PARAMETER` (e.g., `outscale_net.net01.ip_range`).  

For more information, see the [official Terraform documentation](https://www.terraform.io/language/expressions/references#references-to-resource-attributes).

### Example Values

| Parameters     | Example Values 1                           | Example Values 2                             |
|-------------------------|--------------------------------------------|----------------------------------------------|
| **Resource IDs**            | vpc-12345678, vpc-87654321                 | vpc-abcd1234, vpc-1234efgh                   |
| **Net ranges**              | 10.0.0.0/16                                | 10.0.0.0/18                                  |
| **Subnet ranges within the above Net ranges**           | 10.0.0.0/18, 10.0.0.0/22                   | 10.0.0.0/24, 10.0.0.0/25                     |
| **IPs within the above Subnet ranges** | 10.0.0.0, 10.0.30.145, 10.0.0.0, 10.0.0.22 | 10.0.0.0, 10.0.30.215, 10.0.0.0, 10.0.30.127 |
| **Destination ranges**      | 0.0.0.0/0                                 |                                              |
| **Other IPs**               | 192.0.2.0                                  | 192.0.2.215                                  |
| **Path**                    | `<PATH>`                                     |                                              |
| **URL**                     | `<URL>`                                      |                                              |
| **Default Region**          | eu-west-2                                  |                                              |
| **Default endpoint**        | api.eu-west-2.outscale.com                 |                                              |

## Example for the load_balancer_listener_rule Resource

---
### Required resources

```hcl
resource "outscale_vm" "vm01" {
    image_id     = var.image_id
    vm_type      = var.vm_type
    keypair_name = var.keypair_name
}

resource "outscale_load_balancer" "load_balancer01" {
    load_balancer_name = "terraform-public-load-balancer"
    subregion_names    = ["${var.region}a"] # e.g., eu-west-2a
    listeners {
        backend_port           = 80
        backend_protocol       = "TCP"
        load_balancer_protocol = "TCP"
        load_balancer_port     = 80
    }
    tags {
        key   = "name"
        value = "terraform-public-load-balancer"
    }
}

resource "outscale_load_balancer_vms" "outscale_load_balancer_vms01" {
    load_balancer_name = outscale_load_balancer.load_balancer01.id
    backend_vm_ids     = [outscale_vm.vm01.vm_id]
}
```

### Create a listener rule based on the path pattern

```hcl
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
```

### Create a listener rule based on the host pattern

```hcl
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
```
---
