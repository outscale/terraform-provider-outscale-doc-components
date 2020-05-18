resource "outscale_virtual_gateway" "virtual_gateway1" {
  connection_type = "ipsec.1"
  tags {
    key   = "name"
    value = "terraform-virtual-gateway"
  }
}