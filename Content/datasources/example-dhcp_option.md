data "outscale_dhcp_option" "data_dhcp_option" {
	filter {
		name   = "dhcp_options_set_id"
		values = [outscale_dhcp_option.dhcp_option_01.dhcp_options_set_id]
	}
}