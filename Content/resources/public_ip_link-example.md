#resource "outscale_public_ip" "public_ip01" {
#}

#resource "outscale_vm" "vm01" {
#	image_id           = var.image_id
#	vm_type            = var.vm_type
#	keypair_name       = var.keypair_name
#	security_group_ids = [var.security_group_id]
#}

resource "outscale_public_ip_link" "public_ip_link01" {
	vm_id     = outscale_vm.vm01.vm_id
	public_ip = outscale_public_ip.public_ip01.public_ip
}