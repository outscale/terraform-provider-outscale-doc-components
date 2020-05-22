# Create a basic DHCP options set

resource "outscale_dhcp_option" "dhcp_option_01" {
		domain_name = "Domain"
}

# Create a complete DHCP options set

resource "outscale_dhcp_option" "dhcp_option_02" {
		domain_name         = "Domain"
		domain_name_servers = ["111.111.11.111","222.222.22.222"]
		ntp_servers         = ["111.1.1.1","111.111.11.111"]
		tags {
			key = "Name"
			value = "DHCP01"
			}
}
}