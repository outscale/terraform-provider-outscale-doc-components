```hcl
data "outscale_dhcp_option" "dhcp_option01" {
	filter {
		name   = "dhcp_options_set_id"
		values = ["dopt-12345678"]
	}
}
```