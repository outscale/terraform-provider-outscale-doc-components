#resource "outscale_net" "net01" {
#	ip_range = "10.0.0.0/18"
#}

#resource "outscale_internet_service" "internet_service01" {
#}

resource "outscale_internet_service_link" "internet_service_link01" {
	internet_service_id = outscale_internet_service.internet_service01.internet_service_id
	net_id              = outscale_net.net01.net_id
}