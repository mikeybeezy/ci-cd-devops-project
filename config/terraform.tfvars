
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

