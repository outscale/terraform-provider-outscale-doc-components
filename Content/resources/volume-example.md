### Creating an io1 volume

```hcl
resource "outscale_volume" "volume01" {
	subregion_name = "${var.region}a"
	size           = 10
	iops           = 100
	volume_type    = "io1"
}
```

### Creating a snapshot before volume deletion

```hcl
resource "outscale_volume" "volume01" {
    termination_snapshot_name = "deleting_volume_snap"     
    subregion_name = "${var.region}a"
    size           = 40
}
``````