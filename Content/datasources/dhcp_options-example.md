```hcl
data "outscale_dhcp_option" "data_dhcp_options" {
	filter {
		name   = "dhcp_options_set_ids"
		values = ["dopt-12345678","dopt-87654321"]
	}
}
```