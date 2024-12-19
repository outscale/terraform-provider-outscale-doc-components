### Creating a user

```hcl
resource "outscale_user" "user-1"  {
    user_name  = "User-TF-1"
    user_email = "test-TF1@test2.fr"
    path       = "/terraform/"
}
```

### Linking a policy to a user

```hcl
resource "outscale_user" "user-1"  {
    user_name = "User-TF-1"
    policy {
        policy_orn         = outscale_policy.policy-1.orn
        default_version_id = "V1"
    }
}
```