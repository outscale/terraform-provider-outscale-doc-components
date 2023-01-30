```hcl
data "outscale_nets" "nets01" {
    filter {
        name   = "net_ids"
        values = ["vpc-12345678", "vpc-87654321"]
    }
    filter {
        name   = "ip_ranges"
        values = ["10.0.0.0/16"]
    }
}
```