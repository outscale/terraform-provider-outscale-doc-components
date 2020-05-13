data "outscale_internet_service" "internet_service01" {
  filter {
    name   = "internet_service_ids"
    values = ["igw-12345678"]
  }
}