### Create an image

```hcl
resource "outscale_image" "image01" {
  image_name = "terraform-omi-create"
  vm_id      = var.vm_id
  no_reboot  = "true"
}
```

### Import an image
~> **Important** Make sure the manifest file is still valid.

```hcl
resource "outscale_image" "image02" {
  description   = "Terraform register OMI"
  image_name    = "terraform-omi-register"
  file_location = "<URL>"
}
```

### Copy an image

```hcl
resource "outscale_image" "image03" {
  description        = "Terraform copy OMI"
  image_name         = "terraform-omi-copy"
  source_image_id    = "ami-12345678"
  source_region_name = "eu-west-2"
}
```

### Create an image with a Block Storage Unit (BSU) volume

```hcl
resource "outscale_image" "image04" {
  image_name = "terraform-omi-bsu"
  block_device_mappings {
    device_name = "/dev/sda1" 
    bsu {
      snapshot_id           = "snap-12345678"
      volume_size           = "120"
      volume_type           = "io1"
      iops                  = 150
      delete_on_vm_deletion = "true"
    }
  }
  root_device_name = "/dev/sda1"
  description      = "Terraform OMI with BSU"
}
```