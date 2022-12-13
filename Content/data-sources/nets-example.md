```hcl
data "outscale_nets" "nets01" {
    filter {
        name   = "net_ids"
        values = ["vpc-12345678", "vpc-12345679", "vpc-12345680"]
    }
}
```