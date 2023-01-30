```hcl
data "outscale_api_access_rules" "api_access_rules01" {
    filter {
        name   = "ca_ids"
        values = ["ca-12345678", "ca-87654321"]
    }
    filter {
        name   = "ip_ranges"
        values = ["192.0.2.0/16"]
    }
}
```