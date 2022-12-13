```hcl
data "outscale_api_access_rule" "api_access_rule_01" {
    filter {
        name   = "api_access_rule_ids"
        values = ["aar-12345678"]
    }
}
```