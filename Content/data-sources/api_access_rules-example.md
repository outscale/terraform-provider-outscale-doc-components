```hcl
data "outscale_api_access_rules" "api_access_rules_01" {
  filter {
    name   = "api_access_rule_ids"
    values = ["aar-12345678", "aar-87654321"]
  }
}
```