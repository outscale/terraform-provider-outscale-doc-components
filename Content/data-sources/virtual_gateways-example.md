```hcl
data "outscale_virtual_gateways" "virtual_gateways01" {
    filter {
        name   = "states"
        values = ["available"]
    }
    filter {
        name   = "link_states"
        values = ["attached", "detached"]
    }
}
```