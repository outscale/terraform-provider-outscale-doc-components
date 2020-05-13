data "outscale_snapshot" "snapshot01" {
  filter {
    name   = "snapshot_ids"
    values = ["snap-12345678"]
  }
}