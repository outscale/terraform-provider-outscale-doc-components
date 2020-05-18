# Add permissions

resource "outscale_image_launch_permission" "image01" {
	image_id = "ami-12345678"
	permission_additions  {
		account_ids = ["012345678910"]
	}
}

# Remove permissions

resource "outscale_image_launch_permission" "image02" {
	image_id = "ami-12345678"
	permission_removals  {
		account_ids = ["012345678910"]
	}
}