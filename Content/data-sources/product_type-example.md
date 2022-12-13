```hcl
data "outscale_product_type" "product_type01" {
    filter {
        name   = "product_type_ids"
        values = ["0001"]
    }
}
```