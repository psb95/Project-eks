🧭 High-Level Architecture Diagram
The following diagram illustrates the core architecture of this deployment:

<p align="center"> <img width="863" height="446" alt="High-Level Architecture" src="https://github.com/user-attachments/assets/ed876386-eaf0-46fc-8909-7dfd860aab24" /> </p>
Highlights:

The EKS cluster spans across private subnets for improved security.

Node groups are deployed with autoscaling configuration.

Workloads are deployed via Helm with readiness and liveness probes.

Monitoring and logging are routed to AWS CloudWatch.

A GitHub Actions workflow handles the provisioning and deployment pipeline.

🚀 Application Deployment (via Helm)
A successful deployment of the gradyent/tech-interview:latest Docker image has been completed using Helm. Below is a preview of the deployment status:

<p align="center"> <img width="1189" height="444" alt="Helm Deployment" src="https://github.com/user-attachments/assets/b0e01517-6ffd-411c-a644-ef22741f3530" /> </p>
Key configuration:

The application listens on port 8080.

Kubernetes probes are configured:

Readiness Probe: Checks / for OK.

Liveness Probe: Checks /hello for world.

⚙️ CI/CD Automation Workflow
A basic GitHub Actions workflow has been outlined to automate infrastructure provisioning and application deployment. While this workflow provides a strong foundation, it is not fully tested yet and may require adjustments before use in production.

🔧 Overview (Planned Workflow)
The following describes the intended capabilities of the CI/CD pipeline:

Terraform Plan & Apply
Triggered on code push or PR merge, this step provisions or updates the EKS cluster using Terraform.

Kubeconfig Setup
Aims to fetch EKS credentials via aws eks update-kubeconfig, enabling interaction with the cluster from the workflow.

Helm Deployment
Designed to install or upgrade the Helm chart for the gradyent application on the provisioned cluster.