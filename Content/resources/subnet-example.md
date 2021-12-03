### Required resource

```hcl
resource "outscale_net" "net01" {
	ip_range = "10.0.0.0/16"
}
```

### Create a subnet

```hcl
resource "outscale_subnet" "subnet01" {
	net_id   = outscale_net.net01.net_id
	ip_range = "10.0.0.0/18"
}
```