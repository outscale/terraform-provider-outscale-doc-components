data "outscale_client_gateways" "data_client_gateways01" {
filter {
       name   = "client_gateway_ids"
       values = ["cgw-12345678","cgw-87654321"]
    }
}