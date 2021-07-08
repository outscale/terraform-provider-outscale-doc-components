```hcl
data "outscale_snapshot_export_tasks" "snapshot_export_tasks01" {
  filter {
    name   = "task_ids"
    values = ["snap-export-12345678", "snap-export-12345679"]
  }
}
```