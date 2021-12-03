### Required resources

```hcl
resource "outscale_volume" "volume01" {
	subregion_name = "${var.region}a"
	size           = 40
}

resource "outscale_snapshot" "snapshot01" {
	volume_id = outscale_volume.volume01.volume_id
}
```

### Create a snapshot export task

```hcl
resource "outscale_snapshot_export_task" "snapshot_export_task01" {
	snapshot_id = outscale_snapshot.snapshot01.snapshot_id
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