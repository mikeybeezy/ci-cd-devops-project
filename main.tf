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
  source = "./modules/aws_igw"

  vpc_id = ""
  tags   = ""
}


module "route_table" {
  source = "./modules/aws_route_table"
  vpc_id = ""
  tags   = ""
  igw_id = ""


}



module "route_table_ass" {
  source = "./modules/aws_route_table_ass"

  subnet_id      = ""
  route_table_id = ""

}
