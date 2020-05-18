#resource "outscale_net" "net01" {
#  ip_range = "10.0.0.0/16"
#}

#resource "outscale_subnet" "subnet01" {
#  subregion_name = "eu-west-2a"
#  ip_range       = "10.0.0.0/18"
#  net_id         = outscale_net.net01.net_id
#}

resource "outscale_nic" "nic01" {
  subnet_id = outscale_subnet.subnet01.subnet_id
}