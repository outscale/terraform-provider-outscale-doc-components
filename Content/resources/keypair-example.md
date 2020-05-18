# Create a keypair

resource "outscale_keypair" "keypair01" {
	keypair_name = "terraform-keypair-create"
}

# Import a keypair

resource "outscale_keypair" "keypair02" {
	keypair_name = "terraform-keypair-import"
	public_key   = file("<PATH>")
}