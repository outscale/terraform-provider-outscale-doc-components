```hcl
#resource "outscale_net" "net01" { 
#  ip_range = "10.0.0.0/16"
#}

#resource "outscale_route_table" "route_table01" {
#  net_id = outscale_net.net01.net_id
#}

resource "outscale_net_access_point" "net_access_point01" {
   net_id          = outscale_net.net01.net_id
   route_table_ids = [outscale_route_table.route_table01.route_table_id]
   service_name    = "com.outscale.eu-west-2.api"
   tags {
      key   = "name"
      value = "terraform-net-access-point"
   }
}
```