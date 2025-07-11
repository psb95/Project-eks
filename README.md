                       GitHub Actions (CI/CD)
                               |
            +------------------+------------------+
            |                                     |
     Terraform Plan & Apply               Helm Install/Upgrade
            |                                     |
    ------------------------------             ---------------------
    |                            |             |                   |
EKS Cluster Provisioned    Node Group(s)   Helm Chart Deployed  App Pods Running
(private subnets,           (scalable)      (gradyent-app)      (with probes)
 networking, IAM)
            |
    +------------------+
    |                  |
 Monitoring (CloudWatch)  Auto Scaling Enabled
  (optional)             (via node group settings)
