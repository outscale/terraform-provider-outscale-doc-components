```hcl
data "outscale_entities_linked_to_policy" "entities_linked_policy01" {
    policy_orn    = "orn:ows:idauth::012345678910:policy/example/example-policy"
    entities_type = ["USER","GROUP","ACCOUNT"]
}
```