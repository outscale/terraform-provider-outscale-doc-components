```hcl
data "outscale_subnets" "subnets01" {
    filter {
        name   = "net_ids"
        values = ["vpc-12345678", "vpc-12345679"]
    }
}
```