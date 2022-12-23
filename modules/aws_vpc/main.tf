resource "aws_vpc" "main_vpc" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"

  tags = var.tags
}


