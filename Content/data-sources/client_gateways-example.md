```hcl
data "outscale_client_gateways" "client_gateways01" {
    filter {
        name   = "bgp_asns"
        values = ["65000"]
    }
    filter {
        name   = "public_ips"
        values = ["111.11.111.1", "222.22.222.2"]
    }
}
```