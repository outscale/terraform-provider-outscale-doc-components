```hcl
data "outscale_image" "image01" {
    filter {
        name   = "image_ids"
        values = ["ami-12345678"]
    }
}
```