
region = "eu-west-1"

access_key = ""

secret_key = ""


vpc_config = {

  vpc01 = {

    cidr_block = "192.168.0.0/16"

    tags = {

      "Name" = "ci_vpc"
    }
  }
}


subnet_config = {

  "public-eu-west-1a" = {
    vpc_name = "vpc01"

    cidr_block        = "192.168.0.0/18"
    availability_zone = "eu-west-1a"
    tags = {

      "Name" = "public-eu-west-1a"
    }

  }

  "public-eu-west-1b" = {
    vpc_name = "vpc01"

    cidr_block        = "192.168.64.0/18"
    availability_zone = "eu-west-1b"
    tags = {

      "Name" = "public-eu-west-1b"
    }

  }

  "private-eu-west-1a" = {
    vpc_name = "vpc01"

    cidr_block        = "192.168.128.0/18"
    availability_zone = "eu-west-1a"
    tags = {

      "Name" = "public-eu-west-1a"
    }

  }

  "private-eu-west-1b" = {
    vpc_name = "vpc01"

    cidr_block        = "192.168.192.0/18"
    availability_zone = "eu-west-1b"
    tags = {

      "Name" = "public-eu-west-1b"
    }

  }

}



internet_gateway_config = {
  igw01 = {
    vpc_name = "vpc01"
    tags = {
      "Name" = "Main_IGW"
    }
  }


}



elastic_IP_config = {

  eip01 = {
    tags = {
      Name = "nat01"
    }
  }


  eip02 = {
    tags = {
      Name = "nat02"
    }
  }

}

nat_gateway_config = {
  natgw01 = {

    eip_name    = "eip01"
    subnet_name = "public-eu-west-1a"
    tags = {
      "Name" = "natGW01"
    }
  }

  natgw01 = {

    eip_name    = "eip02"
    subnet_name = "public-eu-west-1b"
    tags = {
      "Name" = "natGW02"
    }
  }

}
route_table_config = {

  RT01 = {
    private      = 0
    vpc_name     = "vpc01"
    gateway_name = "igw01"
    tags = {
      "Name" = "public_route"
    }

  }
  RT02 = {
    private      = 1
    vpc_name     = "vpc01"
    gateway_name = "natGW01"
    tags = {
      "Name" = "private_route"
    }


  }

  RT03 = {
    private      = 1
    vpc_name     = "vpc01"
    gateway_name = "natGW02"
    tags = {
      "Name" = "private_route"
    }

  }


}



route_table_associations_config = {
  RT01Assocation = {

    subnet_name      = "public-eu-west-1a"
    route_table_name = "RT01"

  }

  RT02Assocation = {

    subnet_name      = "public-eu-west-1a"
    route_table_name = "RT01"

  }

  RT03Assocation = {

    subnet_name      = "public-eu-west-1a"
    route_table_name = "RT02"

  }

  RT04Assocation = {

    subnet_name      = "public-eu-west-1a"
    route_table_name = "RT03"

  }

}

