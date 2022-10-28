### Require expiration dates for your access keys

```hcl
resource "outscale_api_access_policy" "unique" {
    max_access_key_expiration_seconds = 31536000 # 1 year
    require_trusted_env               = false
}
```

### Activate a trusted session

```hcl
resource "outscale_api_access_policy" "unique" {
    max_access_key_expiration_seconds = 3153600000 # 100 years
    require_trusted_env               = true
}
```

### Deactivate a trusted session

```hcl
resource "outscale_api_access_policy" "unique" {
    max_access_key_expiration_seconds = 0
    require_trusted_env               = false
}
```