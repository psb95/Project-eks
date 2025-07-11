variable "cluster_name" {
  default = "gradyentcluster"
}

variable "aws_region" {
  default = "eu-west-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "private_subnet_cidrs" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}
