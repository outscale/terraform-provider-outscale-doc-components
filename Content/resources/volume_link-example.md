### Required resources

```hcl
resource "outscale_volume" "volume01" {
	subregion_name = "${var.region}a"
	size           = 40
}

resource "outscale_vm" "vm01" {
	image_id           = var.image_id
	vm_type            = var.vm_type
	keypair_name       = var.keypair_name
	security_group_ids = [var.security_group_id]
}
```

### Link a volume to a VM

```hcl
resource "outscale_volume_link" "volumes_link01" {
	device_name = "/dev/xvdc"
	volume_id   = outscale_volume.volume01.id
	vm_id       = outscale_vm.vm01.id
}
```