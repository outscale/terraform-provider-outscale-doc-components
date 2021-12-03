### Read specific server certificates

```hcl
data "outscale_server_certificates" "server_certificates01" {
  filter {
    name   = "paths"
    values = ["<PATH01>", "<PATH02>"]
  }
}
```

### Read all server certificates

```hcl
data "outscale_server_certificates" "all_server_certificates" {
}
```