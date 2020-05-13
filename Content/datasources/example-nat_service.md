data "outscale_nat_service" "nat_service01" {
  filter {
    name   = "nat_service_ids"
    values = ["nat-12345678"]
  }
}