```hcl
data "outscale_security_groups" "security_groups01" {
    filter {
        name   = "net_ids"
        values = ["sg-12345678", "sg-87654321"]
    }
    filter {
        name   = "inbound_rule_ip_ranges"
        values = ["111.11.111.1/32"]
    }
}
```