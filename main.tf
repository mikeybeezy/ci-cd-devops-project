module "vpc_module" {
  source     = "./modules/aws_vpc"
  cidr_block = ""
  tags       = ""

}



module "aws_subnet" {
  source            = "./modules/aws_subnet"
  availability_zone = ""
  cidr_block        = ""
  tags              = ""
  vpc_id            = ""

}
