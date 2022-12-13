```hcl
data "outscale_image_export_task" "image_export_task01" {
    filter {
        name   = "task_ids"
        values = ["image-export-12345678"]
    }
}
```