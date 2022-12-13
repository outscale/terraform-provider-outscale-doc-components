### Read specific product types
```hcl
data "outscale_product_types" "product_types01" {
    filter {
        name   = "product_type_ids"
        values = ["0001", "0002"]
    }    
}
```

### Read all product types
```hcl
data "outscale_product_types" "all_product_types" {
}
```
