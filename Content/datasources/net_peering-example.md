```hcl
data "outscale_net_peering" "net_peering01" {
  filter {
    name   = "net_peering_ids"
    values = ["pcx-12345678"]
  }    
}
```