```hcl
data "outscale_nat_services" "nat_services01" {
    filter {
        name   = "net_ids"
        values = ["vpc-12345678", "vpc-87654321"]
    }
    filter {
        name   = "subnet_ids"
        values = ["eu-west-2a"]
    }
}
```