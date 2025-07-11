High level overview architecture diagram

                                GitHub Actions (CI/CD)
                                       |
                    +------------------+------------------+
                    |                                     |
              terraform plan/apply                 helm install/upgrade
                    |                                     |
        ------------------------------             ---------------------
        |                            |             |                   |
   AWS Resources               EKS Cluster       K8s Namespace      Helm Charts
        |
        +------------------+------------------+------------------+
                           |                  |                  |
                      VPC (3 AZs)         IAM Roles         EKS Cluster
                       (Subnets)             |              (Control Plane)
                           |                 |                  |
                    +------+-----+           |           +------+-----+
                    |            |           |           |            |
            Private Subnet   Private Subnet  |       Managed Node Group
              (AZ-1)             (AZ-2)      |         (EC2 Workers)
                    |            |           |
              EC2 Instances (Kubelets)       |
                                             |
                            Cluster IAM Role (for EKS & Nodes)
