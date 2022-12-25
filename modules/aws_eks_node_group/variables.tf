

# Cluster Config 
variable "cluster_name" {
  type = string
}

variable "node_group_name" {
}

variable "subnet_ids" {
}

# variable "eks_node_group_name" {
# }


# Scaling Config

variable "desired_size" {
  description = ""
  default     = 1
}


variable "max_size" {
  description = ""
  default     = 2
}


variable "min_size" {
  description = ""
  default     = 1
}

variable "max_unavailable" {
  description = ""
  default     = 1
}


variable "ami_type" {
  description = ""
  default     = "ami-0fe0b2cf0e1f25c8a"
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.micro"
}

#tags

variable "tags" {
}


variable "node_iam_role" {
}
