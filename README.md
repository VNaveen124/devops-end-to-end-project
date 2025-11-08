# 3-Tier Web Application on AWS

This repository contains the complete project scaffolding and DevOps pipeline for a 3-tier web application on AWS.

## Architecture

See the [architecture diagram](docs/architecture.puml) for a visual representation of the system.

## Developer Setup

### Prerequisites

* AWS CLI
* kubectl
* Terraform
* Docker
* Node.js and npm
* Python and pip

### Local Development

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-repo.git
   cd your-repo
   ```

2. **Backend:**
   ```bash
   cd backend
   pip install -r requirements.txt
   uvicorn main:app --reload
   ```

3. **Frontend:**
   ```bash
   cd frontend
   npm install
   npm start
   ```

### Local Testing

* **Backend:**
  ```bash
  cd backend
  pytest
  ```
* **Frontend:**
  ```bash
  cd frontend
  npm test
  ```

## Deployment

The deployment process is automated through a Jenkins CI/CD pipeline, which is triggered by a push to the main branch. The pipeline builds, tests, and scans the application, and then triggers a deployment with ArgoCD.

### Code Quality and Security

The CI/CD pipeline integrates two key tools to ensure code quality and security:

*   **SonarQube:** After the unit tests are run, a SonarQube analysis is performed on both the frontend and backend code. The pipeline is configured to check the SonarQube Quality Gate and will fail the build if the gate conditions are not met. This ensures that all new code meets the defined quality standards.

*   **Trivy:** Before deployment, the Docker images for both the frontend and backend are scanned for vulnerabilities using Trivy. The pipeline is set to fail if any `HIGH` or `CRITICAL` severity vulnerabilities are detected, preventing insecure images from being deployed to the cluster.

### Infrastructure

The infrastructure is provisioned with Terraform.

1. **Initialize Terraform:**
   ```bash
   cd terraform
   terraform init
   ```

2. **Plan the changes:**
   ```bash
   terraform plan
   ```

3. **Apply the changes:**
   ```bash
   terraform apply
   ```

### Application

The application is deployed to EKS with ArgoCD. The ArgoCD manifests are in the `argocd` directory.

## Operational Runbook

### Deployments

Deployments are handled automatically by the Jenkins pipeline. To promote a release to a new environment, update the image tag in the corresponding Kustomize overlay.

### Rollbacks

Rollbacks can be performed through the ArgoCD UI or CLI.

### Incident Response

1. **Identify the issue:** Use the Grafana dashboards and DataDog logs to identify the source of the issue.
2. **Escalate:** If the issue cannot be resolved quickly, escalate to the on-call engineer.
3. **Resolve:** Once the issue is resolved, create a post-mortem report to document the incident and identify areas for improvement.

## Cleanup

To destroy the infrastructure, run the following command:

```bash
cd terraform
terraform destroy
```
