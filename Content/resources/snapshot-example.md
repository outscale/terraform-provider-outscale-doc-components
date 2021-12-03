### Required resource

```hcl
resource "outscale_volume" "volume01" {
	subregion_name = "${var.region}a"
	size           = 40
}
```

### Create a snapshot

```hcl
resource "outscale_snapshot" "snapshot01" {
	volume_id = outscale_volume.volume01.volume_id
}
```

### Copy a snapshot

```hcl
resource "outscale_snapshot" "snapshot02" {
	description        = "Terraform snapshot copy"
	source_snapshot_id = "snap-12345678"
	source_region_name = "eu-west-2"
}
```