 ```hcl
resource "outscale_policy" "policy-1"  {
    policy_name = "terraform-policy-1"
    description = "test-terraform"
    document    = file("policy.json")
    path        = "/"
}
```