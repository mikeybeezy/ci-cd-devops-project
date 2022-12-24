variable "vpc_config" {}
variable "subnet_config" {}
variable "route_table_config" {}
variable "route_table_associations_config" {}
variable "elastic_IP_config" {}
variable "nat_gateway_config" {}
variable "internet_gateway_config" {}

variable "region" {
}

variable "access_key" {
  type = string

}

variable "secret_key" {
  type = string
}



# export TF_VAR_access_key="AKIAZDBJ3KAQTORUGBQE"
# export TF_VAR_secret_key="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"
