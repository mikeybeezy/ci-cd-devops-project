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
