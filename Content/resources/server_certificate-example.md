```hcl
resource "outscale_server_certificate" "server_certificate_01" { 
    name        =  "terraform-server-certificate"
    body        =  file("<PATH>")
    chain       =  file("<PATH>")
    private_key =  file("<PATH>")
    path        =  "<PATH>"
}
```
