```hcl
data "outscale_images" "images01" {
    filter {
        name   = "image_ids"
        values = ["ami-12345678", "ami-12345679"]
    }
}
```