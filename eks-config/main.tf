module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.2"

  name = "eks-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-west-2a", "us-west-2b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Environment = "dev"
    Project     = "eks-scalable-demo"
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.4"

  cluster_name    = "gradyentcluster"
  cluster_version = "1.33.1"
  subnet_ids      = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = false
  cluster_enabled_log_types = []
  create_cloudwatch_log_group = true
  enable_irsa = false

  eks_managed_node_groups = {
    gradynet-node-1 = {
      desired_size = 2
      max_size     = 4
      min_size     = 2

      instance_types = ["t3.medium"]

      labels = {
        role = "general"
      }

      tags = {
        Name = "eks-node-group"
      }
    }
  }

  tags = {
    Environment = "dev"
    Project     = "eks-scalable-demo"
  }
}
