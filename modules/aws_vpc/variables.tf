variable "availability_zone" {
  description = "value"
  default     = ""
}


variable "cidr_block" {
  description = "value"
  default     = "10.0.1.0/24"
}


variable "tags " {
  description = "value"
  default     = "default"
}


variable "vpc_id" {
  default = aws_vpc.main.id
}

