```hcl
data "outscale_image_export_tasks" "image_export_tasks01" {
    filter {
        name   = "task_ids"
        values = ["image-export-12345678", "image-export-87654321"]
    }
}
```