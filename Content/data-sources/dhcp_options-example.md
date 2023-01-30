```hcl
data "outscale_dhcp_options" "dhcp_options01" {
    filter {
        name   = "domain_name_servers"
        values = ["111.11.111.1", "222.22.222.2"]
    }
    filter {
        name   = "domain_names"
        values = ["example.com"]
    }
}
```