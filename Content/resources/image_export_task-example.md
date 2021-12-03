### Required resource

```hcl
resource "outscale_image" "image01" {
  image_name = "terraform-image-to-export"
  vm_id      = "i-12345678"
}
```

### Create an image export task

```hcl
resource "outscale_image_export_task" "image_export_task01" {
	image_id = outscale_image.image01.image_id
	osu_export {
		disk_image_format = "qcow2"
		osu_bucket        = "terraform-bucket"
		osu_prefix        = "new-export"
		osu_api_key {
			api_key_id = var.access_key_id
			secret_key = var.secret_key_id
		}
	}
	tags {
		key   = "Name"
		value = "terraform-snapshot-export-task"
	}
}
```