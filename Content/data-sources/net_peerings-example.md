```hcl
data "outscale_net_peerings" "net_peerings01" {
    filter {
        name   = "source_net_net_ids"
        values = ["vpc-12345678"]
    }
    filter {
        name   = "state_names"
        values = ["active", "pending-acceptance"]
    }
}
```