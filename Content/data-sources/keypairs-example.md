```hcl
data "outscale_keypairs" "keypairs01" {
	filter {
		name   = "keypair_names"
		values = ["terraform-keypair-01", "terraform-keypair-02"]
	}
}
```