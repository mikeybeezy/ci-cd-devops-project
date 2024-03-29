
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


#Elastic IP config 
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

# NAT Gateway Name 
nat_gateway_config = {
  natgw01 = {

    eip_name    = "eip01"
    subnet_name = "public-eu-west-1a"
    tags = {
      "Name" = "natGW01"
    }
  }

  natgw02 = {

    eip_name    = "eip02"
    subnet_name = "public-eu-west-1b"
    tags = {
      "Name" = "natGW02"
    }
  }

}

# Internet Gateway Config
internet_gateway_config = {
  igw01 = {
    vpc_name = "vpc01"
    tags = {
      "Name" = "Main_IGW"
    }
  }


}


# Route Table Config
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
    gateway_name = "natgw01"
    tags = {
      "Name" = "private_route"
    }


  }

  RT03 = {
    private      = 1
    vpc_name     = "vpc01"
    gateway_name = "natgw02"
    tags = {
      "Name" = "private_route"
    }

  }


}


# Royte Table Associations
route_table_associations_config = {
  RT01Assocation = {

    subnet_name      = "public-eu-west-1a"
    route_table_name = "RT01"
    tags = {
      "Name" = "public_igw_rt01_assocation"
    }


  }

  RT02Assocation = {

    subnet_name      = "public-eu-west-1a"
    route_table_name = "RT01"
    tags = {
      "Name" = "public_rt01_assocation"
    }

  }

  RT03Assocation = {

    subnet_name      = "public-eu-west-1a"
    route_table_name = "RT02"
    tags = {
      "Name" = "public_rt02_assocation"
    }

  }

  RT04Assocation = {

    subnet_name      = "public-eu-west-1a"
    route_table_name = "RT03"

  }

}


# EKS Config 

aws_eks_config = {

  "aws_eks_config_v1" = {
    eks_cluster_name = "dev-cluster"
    subnet1          = "public-eu-west-1a"
    subnet2          = "public-eu-west-1b"
    subnet3          = "private-eu-west-1a"
    subnet4          = "private-eu-west-1b"
    tags = {
      "Name" = "subnets"
    }

  }



}


aws_eks_node_group_config = {

  "node_group_1" = {
    node_group_name  = "app_node_group_1"
    eks_cluster_name = "aws_eks_config_v1"
    node_iam_role    = "eks-node-general-1"
    subnet1          = "private-eu-west-1a"
    subnet2          = "private-eu-west-1b"
    tags = {
      "Name" = "node_group_1"
    }
  }

  "node_group_2" = {
    node_group_name  = "tools_node_group_1"
    eks_cluster_name = "aws_eks_config_v1"
    node_iam_role    = "eks-node-general-1"
    subnet1          = "private-eu-west-1a"
    subnet2          = "private-eu-west-1b"
    tags = {
      "Name" = "node_group_2"
    }
  }


}
