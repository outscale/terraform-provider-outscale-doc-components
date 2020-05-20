# Create a VM in the Public Cloud

resource "outscale_vm" "vm01" {
  image_id                 = var.image_id
  vm_type                  = var.vm_type
  keypair_name             = var.keypair_name
  security_group_ids       = [var.security_group_id]
  placement_subregion_name = "eu-west-2a"
  placement_tenancy        = "default"
  tags {
    key   = "name"
    value = "terraform-public-vm"
  }
  user_data                = base64encode(<<EOT
# content
# content
EOT
  )
}

# Create a VM with block device mappings

resource "outscale_vm" "vm02" {
  image_id                = var.image_id
  vm_type                 = var.vm_type
  keypair_name            = var.keypair_name
  block_device_mappings {
    device_name = "/dev/sdb"
    bsu  {
      volume_size = 15
      volume_type = "gp2"
      snapshot_id = var.snapshot_id
    }
  }  
  block_device_mappings {
    device_name = "/dev/sdc"
    bsu  {
      volume_size           = 22
      volume_type           = "io1"
      iops                  = 150
      delete_on_vm_deletion = true
    }
  }
}

# Create a VM in the Private Cloud

resource "outscale_net" "net01" {
  ip_range = "10.0.0.0/16"
  tags  {
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

resource "outscale_security_group" "security_01" {
  description         = "Terraform security group for VM"
  security_group_name = "terraform-security-group-for-vm"
  net_id              = outscale_net.net01.net_id
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

# Create a VM with a NIC

resource "outscale_net" "net02" {
   ip_range = "10.0.0.0/16"
}

resource "outscale_subnet" "subnet02" {
  net_id         = outscale_net.net02.net_id
  ip_range       = "10.0.0.0/24"
  subregion_name = "eu-west-2a"
}

resource "outscale_nic" "nic01" {
  subnet_id = outscale_subnet.subnet02.subnet_id
}

resource "outscale_vm" "vm04" {
  image_id     = var.image_id
  vm_type      = "c4.large"
  keypair_name = var.keypair_name
  nics {
    nic_id        = outscale_nic.nic01.nic_id
    device_number = "0"
  }
}