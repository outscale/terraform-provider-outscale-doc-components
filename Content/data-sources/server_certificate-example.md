```hcl
data "outscale_server_certificate" "server_certificate01" {
  filter {
    name   = "paths"
    values = "<PATH>"
  }
}
```