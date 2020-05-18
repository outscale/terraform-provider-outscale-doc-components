#resource "outscale_net" "net01" {
#	ip_range = "10.0.0.0/16"
#}

#resource "outscale_subnet" "subnet01" {
#	subregion_name = "${var.region}a"
#	ip_range       = "10.0.0.0/16"
#	net_id         = outscale_net.net01.net_id
#}

#resource "outscale_nic" "nic01" {
#	subnet_id = outscale_subnet.subnet01.subnet_id
#}

resource "outscale_nic_private_ip" "nic_private_ip01" {
	nic_id      = outscale_nic.nic01.nic_id
	private_ips = ["10.0.12.34"]
}
resource "outscale_nic_private_ip" "nic_private_ip02" {
	nic_id                     = outscale_nic.nic01.nic_id
	secondary_private_ip_count = 2
}
