```hcl
resource "outscale_policy_version" "Policy2-version-02" {
    policy_orn     = outscale_policy.policy-2.orn
    document       = file("policy.json")
    set_as_default = true
}
```