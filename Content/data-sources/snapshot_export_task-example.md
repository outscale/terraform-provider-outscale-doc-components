```hcl
data "outscale_snapshot_export_task" "snapshot_export_task01" {
    filter {
        name   = "task_ids"
        values = ["snap-export-12345678"]
    }
}
```