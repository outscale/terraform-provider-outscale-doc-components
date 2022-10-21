```hcl
resource "outscale_api_access_rule" "api_access_rule_01" {
  ca_ids = ["ca-12345678"]

  ip_ranges = ["192.0.2.0", "192.0.2.0/16"]

  cns = ["cn-1"]

  description = "API Access Rules for Terraform"
}
```