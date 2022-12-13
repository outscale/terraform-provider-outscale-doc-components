### List all services available to create Net access points

```hcl
data "outscale_net_access_point_services" "all-services" { 
}
```

### List one or more services according to their service IDs

```hcl
data "outscale_net_access_point_services" "services01" {
    filter {
        name   = "service_ids"
        values = ["pl-12345678","pl-12345679"]
    }
}
```

### List one or more services according to their service names

```hcl
data "outscale_net_access_point_services" "services02" {
    filter {
        name   = "service_names"
        values = ["com.outscale.eu-west-2.api"]
    }
}
```