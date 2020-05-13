data "outscale_public_ips" "public_ips01" {
  filter {
    name   = "public_ips"
    values = ["111.11.111.1", "222.22.222.2"]
  }
}