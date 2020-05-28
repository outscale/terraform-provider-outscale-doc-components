data "outscale_nic" "nic01" {
  filter {
    name   = "nic_ids"
    values = ["eni-12345678"]
  }    
}