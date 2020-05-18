# Create an image

resource "outscale_image" "image01" {
  image_name = "terraform-omi-create"
  vm_id      = var.vm_id
  no_reboot  = "true"
}

# Import an image
## Make sure the manifest is still valid.

resource "outscale_image" "image02" {
  description   = "Terraform register OMI"
  image_name    = "terraform-omi-register"
  file_location = "<URL>"
}

# Copy an image

resource "outscale_image" "image03" {
  description        = "Terraform copy OMI"
  image_name         = "terraform-omi-copy"
  source_image_id    = "ami-12345678"
  source_region_name = "eu-west-2"
}