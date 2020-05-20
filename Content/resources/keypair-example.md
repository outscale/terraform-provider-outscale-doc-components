# Create a keypair

resource "outscale_keypair" "keypair01" {
	keypair_name = "terraform-keypair-create"
}

# Import keypairs

resource "outscale_keypair" "keypair02" {
	keypair_name = "terraform-keypair-import-file"
	public_key   = file("<PATH>")
}

resource "outscale_keypair" "keypair03" {
	keypair_name = "terraform-keypair-import-text"
	public_key   = "UFVCTElDIEtFWQ=="
}