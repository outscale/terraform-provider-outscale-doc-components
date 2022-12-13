### All types of VMs
```hcl
data "outscale_vm_types" "all_vm_types" {
}
```

### VMs optimized for Block Storage Unit (BSU)
```hcl
data "outscale_vm_types" "vm_types01" {
    filter {
        name   = "bsu_optimized"
        values = [true]
    }
}
```

### Specific VM type
```hcl
data "outscale_vm_types" "vm_types02" {
    filter {
        name   = "vm_type_names"
        values = ["m3.large"]
    }
}
```