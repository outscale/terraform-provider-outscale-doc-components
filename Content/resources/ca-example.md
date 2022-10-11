```hcl
resource "outscale_ca" "ca01" {
    ca_pem      = file("<PATH>")
    description = "Terraform certificate authority"
}
```