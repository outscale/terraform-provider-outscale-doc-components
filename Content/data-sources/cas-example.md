```hcl
data "outscale_cas" "cas01" {
    filter {
        name   = "ca_ids"
        values = ["ca-12345678", "ca-87654321"]
    }
}
```