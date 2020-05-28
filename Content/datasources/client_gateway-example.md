data "outscale_client_gateway" "data_client_gateway" {
filter {
       name   = "client_gateway_ids"
       values = ["cgw-12345678"]
    }
}