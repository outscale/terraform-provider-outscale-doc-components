```hcl
data "outscale_images" "images01" {
    filter {
        name   = "account_aliases"
        values = ["Outscale"]
    }
    filter {
        name   = "image_names"
        values = ["Ubuntu*", "RockyLinux*"]
    }
}
```