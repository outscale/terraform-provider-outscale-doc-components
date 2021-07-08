### Required resources

```hcl
resource "outscale_net" "net01" {
  ip_range = "10.0.0.0/16"
}

resource "outscale_subnet" "subnet01" {
  subregion_name = "eu-west-2a"
  ip_range       = "10.0.0.0/18"
  net_id         = outscale_net.net01.net_id
}

resource "outscale_security_group" "security_group01" {
  description         = "Terraform security group for nic with private IPs"
  security_group_name = "terraform-security-group-nic-ips"
  net_id              = outscale_net.net01.net_id
}
```

### Create a NIC

```hcl
resource "outscale_nic" "nic01" {
  subnet_id = outscale_subnet.subnet01.subnet_id
}

```

### Create a NIC with private IPs

```hcl
resource "outscale_nic" "nic02" {
  description       = "Terraform nic with private IPs"
  subnet_id         = outscale_subnet.outscale_subnet01.subnet_id
  security_group_ids = [outscale_security_group.outscale_security_group1.security_group_id]
  private_ips {
    is_primary = true
    private_ip = "10.0.0.1"
  }
  private_ips {
    is_primary = false
    private_ip = "10.0.0.2"
  }
}
```