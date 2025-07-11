provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_role" "eks_cluster_role" {
  name = "eks-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "eks.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_security_group" "eks_cluster_sg" {
  name        = "gradyentclustersg"
  description = "EKS Cluster SG"
  vpc_id      = var.vpc_id
}

resource "aws_eks_cluster" "ekscluster" {
  name     = "gradyentcluster"
  role_arn = aws_iam_role.eks_cluster_role.arn
  version  = "1.33.1"

  vpc_config {
    subnet_ids         = var.subnet_ids
    security_group_ids = [aws_security_group.eks_cluster_sg.id]
    endpoint_private_access = true
    endpoint_public_access  = false
  }

  access_config {
    authentication_mode = "API_AND_CONFIG_MAP"
  }
}

