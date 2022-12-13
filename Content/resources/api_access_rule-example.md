### Create an API access rule based on IPs

```hcl
resource "outscale_api_access_rule" "api_access_rule01" {
    ip_ranges   = ["192.0.2.0", "192.0.2.0/16"]
    description = "Basic API Access Rule from Terraform"
}
```

### Create an API access rule based on IPs and Certificate Authority (CA)

```hcl
resource "outscale_ca" "ca01" {
    ca_pem      = file("<PATH>")
    description = "Terraform CA"
}

resource "outscale_api_access_rule" "api_access_rule02" {
    ip_ranges   = ["192.0.2.0", "192.0.2.0/16"]
    ca_ids      = [outscale_ca.ca01.ca_id]
    description = "API Access Rule with CA from Terraform"
}
```