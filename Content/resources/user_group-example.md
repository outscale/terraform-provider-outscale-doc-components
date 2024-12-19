### Create a user group

```hcl
resource "outscale_user_group" "group-1" {
    user_group_name = "Group-TF-test-1"
    path            = "/terraform/"
}
```

### Link a policy to a user group

```hcl
resource "outscale_user_group" "group-1" {
    user_group_name = "Group-TF-test-1"
    policy {
        policy_orn         = outscale_policy.policy-2.orn
        default_version_id = "V2"
    }
}
```

### Add a user to a user group

```hcl
resource "outscale_user_group" "group-1" {
    user_group_name = "Group-TF-test-1"
    user {
        user_name = "user-name-1"
        path      = "/terraform/"
    }
    user {
        user_name = "user-name-2"
    }
}
```

### Create a user group, and add a user and a policy to it

```hcl
resource "outscale_user_group" "group-1" {
  user_group_name = "Group-TF-test-1"
    user {
        user_name = "user-name-1"
        path      = "/terraform/"
    }
    user {
        user_name = "user-name-2"
    }
    policy {
        policy_orn = outscale_policy.policy-2.orn
        version_id = "V2"
    }
}
```
