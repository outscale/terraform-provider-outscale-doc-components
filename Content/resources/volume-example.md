resource "outscale_volume" "volume01" {
  subregion_name = "${var.region}a"
  size           = 10
  iops           = 100
  volume_type    = "io1"
}