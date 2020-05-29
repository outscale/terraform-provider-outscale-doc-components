data "outscale_public_ip" "public_ip01" {
  filter {
    name   = "public_ips"
    values = ["111.11.111.1"]
  }
}