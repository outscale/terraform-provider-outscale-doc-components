### Read specific quotas
```hcl
data "outscale_quotas" "vpc_quotas01" {
  filter {
    name     = "collections"
    values   = ["VPC"]
  }
}
```

### Read all quotas
```hcl
data "outscale_quotas" "all_quotas" {
}
```