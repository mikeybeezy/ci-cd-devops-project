resource "aws_nat_gateway" "main_nat_gw" {
  allocation_id = var.elastic_ip_allocation_id # may need to add .i here 
  subnet_id     = var.subnet_id

  tags = var.tags

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.example]
}


