variable "vpc_config" {}
variable "subnet_config" {}
variable "route_table_config" {}
variable "route_table_associations_config" {}
variable "elastic_IP_config" {}
variable "nat_gateway_config" {}
variable "internet_gateway_config" {}
variable "aws_eks_config" {}
variable "aws_eks_node_group_config" {}

variable "region" {
}

variable "access_key" {
  type = string

}

variable "secret_key" {
  type = string
}
