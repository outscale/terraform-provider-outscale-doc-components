data "outscale_dhcp_option" "data_dhcp_options" {
	filter {
		name   = "dhcp_options_set_ids"
		values = [outscale_dhcp_option.dhcp_option_01.dhcp_options_set_id,outscale_dhcp_option.dhcp_option_02.dhcp_options_set_id]
	}
}