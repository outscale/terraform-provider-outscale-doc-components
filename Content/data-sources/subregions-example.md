### List a specific Subregion in the current Region

```hcl
data "outscale_subregions" "subregions01" {
    filter {
        name   = "subregion_names"
        values = ["eu-west-2a"]
    }
}
```

### List two specific Subregions in the current Region

```hcl
data "outscale_subregions" "subregions02" {
    filter {
        name   = "subregion_names"
        values = ["eu-west-2a", "eu-west-2b"]
    }
}
```
### List all accessible Subregions in the current Region

```hcl
data "outscale_subregions" "all-subregions" {
}
```