### List Net access points

```hcl
data "outscale_net_access_points" "net_access_points01" {
    filter {
        name   = "net_access_point_ids"
        values = ["vpce-12345678","vpce-12345679"]
    }
}
```

### List Net access points according to their Net and state

```hcl
data "outscale_net_access_points" "net_access_points02" {
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