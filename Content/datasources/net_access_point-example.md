### List a Net access point

```hcl
data "outscale_net_access_point" "net_access_point01" {
    filter {
        name   = "net_access_point_ids"
        values = ["vpce-12345678"]
    }
}
```

### List a Net access point according to its Net and state

```hcl
data "outscale_net_access_point" "net_access_point02" {
    filter {
        name   = "net_ids"
        values = ["vpc-12345678"]
    }
    filter {
        name   = "states"
        values = ["available"]
    }
}
```