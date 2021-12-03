### Required resources

```hcl
resource "outscale_net" "net01" {
	ip_range = "10.0.0.0/16"
}

resource "outscale_subnet" "subnet01" {
	subregion_name = "${var.region}a"
	ip_range       = "10.0.0.0/16"
	net_id         = outscale_net.net01.net_id
}

resource "outscale_vm" "vm01" {
	image_id     = var.image_id
	vm_type      = var.vm_type
	keypair_name = var.keypair_name
	subnet_id    = outscale_subnet.subnet01.subnet_id
}

resource "outscale_nic" "nic01" {
	subnet_id = outscale_subnet.subnet01.subnet_id
}
```

### Link a NIC to a VM

```hcl
resource "outscale_nic_link" "nic_link01" {
	device_number = "1"
	vm_id         = outscale_vm.vm01.vm_id
	nic_id        = outscale_nic.nic01.nic_id
}
```