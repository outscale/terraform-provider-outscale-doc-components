data "outscale_vms_state" "vm_states01" {
  filter {
    name   = "vm_ids"
    values = ["i-12345678", "i-12345679"]
  }
}