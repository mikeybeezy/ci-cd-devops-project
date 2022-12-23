resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"

  tags = var.tagsq
}


variable "cidr_block " {
  description = "value"
  default     = "10.0.0.0/16"
}


variable "tags " {
  description = "value"
  default     = "default"
}
