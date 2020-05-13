data "outscale_snapshots" "snapshots01" {
  filter {
    name   = "snapshot_ids"
    values = ["snap-12345678", "snap-12345679"]
  }
}