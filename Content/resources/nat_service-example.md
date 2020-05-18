#resource "outscale_net" "net01" {
#  ip_range = "10.0.0.0/16"
#}

#resource "outscale_subnet" "subnet01" {
#  net_id   = outscale_net.net01.net_id
#  ip_range = "10.0.0.0/18"
#}

#resource "outscale_public_ip" "public_ip01" {
#}

resource "outscale_nat_service" "nat_service01" {
  subnet_id    = outscale_subnet.subnet01.subnet_id
  public_ip_id = outscale_public_ip.public_ip01.public_ip_id
}