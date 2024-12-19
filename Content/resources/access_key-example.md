### Creating an access key for yourself

```hcl
resource "outscale_access_key" "access_key01" {
    state           = "ACTIVE"
    expiration_date = "2028-01-01"
}
```

### Creating an access key for another user

```hcl
resource "outscale_access_key" "access_key_eim01" {
    user_name       = outscale_user.user-1.user_name
    state           = "ACTIVE"
    expiration_date = "2028-01-01"
    depends_on      = [outscale_user.user-1]
}
```