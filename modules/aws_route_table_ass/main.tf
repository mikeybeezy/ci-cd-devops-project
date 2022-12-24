resource "aws_route_table_association" "a" {
  subnet_id      = var.route_table_id
  route_table_id = var.route_table_id
}


