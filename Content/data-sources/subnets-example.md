```hcl
data "outscale_subnets" "subnets01" {
    filter {
        name   = "states"
        values = ["available"]
    }
    filter {
        name   = "subregion_names"
        values = ["eu-west-2a", "eu-west-2b"]
    }
}
```