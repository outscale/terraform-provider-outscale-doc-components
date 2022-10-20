```hcl
resource "outscale_api_access_policy" "policy01" {
    max_access_key_expiration_seconds = 3153600000
    require_trusted_env               = false
}
```