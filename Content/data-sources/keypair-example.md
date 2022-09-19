```hcl
data "outscale_keypair" "keypair01" {
	filter {
		name   = "keypair_names"
		values = ["terraform-keypair-01"]
	}
}
```