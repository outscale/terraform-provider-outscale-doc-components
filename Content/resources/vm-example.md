### Optional resource

```hcl
resource "outscale_keypair" "keypair01" {
	keypair_name = "terraform-keypair-for-vm"
}
```

### Create a VM in the public Cloud

```hcl
resource "outscale_security_group" "security_group01" {
  description         = "vm security group"
  security_group_name = "vm_security_group1"
}

resource "outscale_vm" "vm01" {
	image_id                 = var.image_id
	vm_type                  = var.vm_type
	keypair_name             = var.keypair_name
	security_group_ids       = [outscale_security_group.security_group01.security_group_id]
	placement_subregion_name = "eu-west-2a"
	placement_tenancy        = "default"
	tags {
		key   = "name"
		value = "terraform-public-vm"
	}
	user_data                = base64encode(<<EOF
	<CONFIGURATION>
	EOF
	)
}
```

### Create a VM with block device mappings

```hcl
resource "outscale_security_group" "security_group01" {
  description         = "vm security group"
  security_group_name = "vm_security_group1"
}

resource "outscale_vm" "vm02" {
	image_id                = var.image_id
	vm_type                 = var.vm_type
	keypair_name            = var.keypair_name
	security_group_ids  	= [outscale_security_group.security_group01.security_group_id]
	block_device_mappings {
		device_name = "/dev/sda1" # /dev/sda1 corresponds to the root device of the VM
		bsu {
			volume_size = 15
			volume_type = "gp2"
			snapshot_id = var.snapshot_id
		}
	}
	block_device_mappings {
		device_name = "/dev/sdb"
		bsu {
			volume_size           = 22
			volume_type           = "io1"
			iops                  = 150
			delete_on_vm_deletion = true
		}
	}
}


resource "outscale_security_group" "security_group01" {
  description         = "vm security group"
  security_group_name = "vm_security_group1"
}

resource "outscale_vm" "vm02" {
	image_id 				= var.image_id
 	vm_type 				= var.vm_type
 	keypair_name 			= var.keypair_name
	security_group_ids 		= [outscale_security_group.security_group01.security_group_id]
 	block_device_mappings {
		device_name = "/dev/sdb"
		bsu {
			volume_size           = 30
			volume_type           = "gp2"
			snapshot_id           = outscale_snapshot.snapshot.id
			delete_on_vm_deletion = false
			tags {
				key                   = "Name"
				value                 = "bsu-tags-gp2"
			}
		}
	}
}
```

### Create a VM in a Net with a network

```hcl
resource "outscale_net" "net01" {
	ip_range = "10.0.0.0/16"
	tags {
		key   = "name"
		value = "terraform-net-for-vm"
	}
}

resource "outscale_subnet" "subnet01" {
	net_id         = outscale_net.net01.net_id
	ip_range       = "10.0.0.0/24"
	subregion_name = "eu-west-2b"
	tags {
		key   = "name"
		value = "terraform-subnet-for-vm"
	}
}

resource "outscale_security_group" "security_group01" {
	description          = "Terraform security group for VM"
	security_group_name = "terraform-security-group-for-vm"
	net_id               = outscale_net.net01.net_id
}

resource "outscale_internet_service" "internet_service01" {
}

resource "outscale_route_table" "route_table01" {
	net_id = outscale_net.net01.net_id
	tags {
		key   = "name"
		value = "terraform-route-table-for-vm"
	}
}

resource "outscale_route_table_link" "route_table_link01" {
	route_table_id = outscale_route_table.route_table01.route_table_id
	subnet_id      = outscale_subnet.subnet01.subnet_id
}

resource "outscale_internet_service_link" "internet_service_link01" {
	internet_service_id = outscale_internet_service.internet_service01.internet_service_id
	net_id              = outscale_net.net01.net_id
}

resource "outscale_route" "route01" {
	gateway_id           = outscale_internet_service.internet_service01.internet_service_id
	destination_ip_range = "0.0.0.0/0"
	route_table_id       = outscale_route_table.route_table01.route_table_id
}

resource "outscale_vm" "vm03" {
	image_id           = var.image_id
	vm_type            = var.vm_type
	keypair_name       = var.keypair_name
	security_group_ids = [outscale_security_group.security_group01.security_group_id]
	subnet_id          = outscale_subnet.subnet01.subnet_id
}
```

### Create a VM with a primary NIC

~> **Note:** If you plan to use the `outscale_nic_link`resource, it is recommended to specify the `primary_nic` argument to define the primary network interface of a VM.

```hcl
resource "outscale_security_group" "security_group01" {
  description         = "vm security group"
  security_group_name = "vm_security_group1"
}

resource "outscale_net" "net02" {
	ip_range = "10.0.0.0/16"
	tags {
		key   = "name"
		value = "terraform-net-for-vm-with-nic"
	}
}

resource "outscale_subnet" "subnet02" {
	net_id         = outscale_net.net02.net_id
	ip_range       = "10.0.0.0/24"
	subregion_name = "eu-west-2a"
	tags {
		key   = "name"
		value = "terraform-subnet-for-vm-with-nic"
	}
}
resource "outscale_nic" "nic01" {
	subnet_id = outscale_subnet.subnet02.subnet_id
}

resource "outscale_vm" "vm04" {
	image_id     		= var.image_id
	vm_type      		= "tinav5.c1r1p2"
	keypair_name 		= var.keypair_name
	security_group_ids  = [outscale_security_group.security_group01.security_group_id]
	primary_nic {
		nic_id        = outscale_nic.nic01.nic_id
		device_number = "0"
	}
}
```

### Create a VM with secondary NICs

```hcl
resource "outscale_security_group" "security_group01" {
  description         = "vm security group"
  security_group_name = "vm_security_group1"
}

resource "outscale_net" "net02" {
    ip_range = "10.0.0.0/16"
    tags {
        key   = "name"
        value = "terraform-net-for-vm-with-nic"
    }
}

resource "outscale_subnet" "subnet02" {
    net_id         = outscale_net.net02.net_id
    ip_range       = "10.0.0.0/24"
    subregion_name = "eu-west-2a"
    tags {
        key   = "name"
        value = "terraform-subnet-for-vm-with-nic"
    }
}
resource "outscale_nic" "nic01" {
    subnet_id = outscale_subnet.subnet02.subnet_id
}

resource "outscale_vm" "vm04" {
    image_id     		= var.image_id
    vm_type      		= "tinav5.c1r1p2"
    keypair_name 		= var.keypair_name
	security_group_ids  = [outscale_security_group.security_group01.security_group_id]
    nics {
        nic_id        = outscale_nic.nic01.nic_id
        device_number = "0"
	}
	nics {	
		nic_id        = outscale_nic.nic02.nic_id
        device_number = "1"
    }
}
```