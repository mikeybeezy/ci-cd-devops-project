module "vpc_module" {
  source     = "./modules/aws_vpc"
  for_each   = var.vpc_config
  cidr_block = each.value.cidr_block



  tags = each.value.tags

}



module "aws_subnet" {
  source            = "./modules/aws_subnet"
  for_each          = var.subnet_config
  availability_zone = each.value.availability_zone
  cidr_block        = each.value.cidr_block
  tags              = each.value.tags
  vpc_id            = module.vpc_module[each.value.vpc_name].vpc_id

}



module "internet_gateway" {
  source   = "./modules/aws_igw"
  for_each = var.internet_gateway_config
  vpc_id   = module.vpc_module[each.value.vpc_name].vpc_id
  tags     = each.value.tags
}


module "route_table" {
  source   = "./modules/aws_route_table"
  for_each = var.route_table_config
  vpc_id   = module.vpc_module[each.value.vpc_name].vpc_id
  igw_id   = each.value.private == 0 ? module.internet_gateway[each.value.gateway_name].internet_gateway_id : module.nat_gateway[each.value.gateway_name].natgateway_id
  tags     = each.value.tags


}



module "route_table_ass" {
  source         = "./modules/aws_route_table_ass"
  for_each       = var.route_table_associations_config
  subnet_id      = module.aws_subnet[each.value.subnet_name].main_subnet
  route_table_id = module.route_table[each.value.route_table_name].route_table_id
}


module "elastic_ip" {
  source   = "./modules/aws_elastic_ip"
  for_each = var.elastic_IP_config
  tags     = each.value.tags


}

module "nat_gateway" {

  source                   = "./modules/aws_nat_gateway"
  for_each                 = var.nat_gateway_config
  subnet_id                = module.aws_subnet[each.value.subnet_name].main_subnet
  elastic_ip_allocation_id = module.elastic_ip[each.value.eip_name].elastic_ip_id
  tags                     = each.value.tags


}

