data "outscale_vm" "vm_01" {
  filter {
    name   = "vm_ids"
    values = ["i-12345678"]
  }
}