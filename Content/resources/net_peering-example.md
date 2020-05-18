#resource "outscale_net" "net01" {
#  ip_range = "10.10.0.0/24"
#}

#resource "outscale_net" "net02" {
#  ip_range = "10.31.0.0/16"
#}

resource "outscale_net_peering" "net_peering01" {
  accepter_net_id = outscale_net.net01.net_id
  source_net_id   = outscale_net.net02.net_id
}