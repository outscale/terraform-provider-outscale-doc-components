```hcl
data "outscale_net_peerings" "net_peerings01" {
  filter {
    name   = "net_peering_ids"
    values = ["pcx-12345678", "pcx-12345679"]
  }    
}
```