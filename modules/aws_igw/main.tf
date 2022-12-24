resource "aws_internet_gateway" "main_igw" {
  vpc_id = var.vpcid

  tags = var.tags
}



output "internet_gateway" {
  value = aws_internet_gateway.main_igw.id

}
