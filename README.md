# AWS CI/CD Pipeline with Terraform Deployment
This AWS CI/CD pipeline script automates the deployment of an AWS infrastructure using Terraform, AWS CodeBuild, and AWS CodePipeline.

Prerequisites
Before running this pipeline, make sure you have the following prerequisites:

- An AWS account
- Terraform installed on your local machine
- AWS CLI configured with appropriate permissions
# Pipeline Overview
This AWS CI/CD pipeline consists of the following stages:

- Source: Fetches the Terraform code from the version control system (e.g., GitHub).
- Build: Executes the build process using AWS CodeBuild and installs the required dependencies.
- Manual Approval: Allows manual approval to proceed with the infrastructure deployment.
- Deploy: Deploys the infrastructure using Terraform apply with auto-approval.
- Cleanup: Cleans up the resources by destroying the infrastructure if needed.
Terraform Backend Configuration
To store the Terraform state file (terraform.tfstate) in an S3 bucket, configure the backend as follows in your Terraform code:

```bash
  terraform {
  backend "s3" {
    bucket = "merabuckethai09"
    key    = "tfstate/terraform.tfstate"
    region = "ap-south-1"
  }
}
```
Usage
To use this AWS CI/CD pipeline with Terraform deployment, follow these steps:

- Fork or clone this repository to your local machine.
- Navigate to the directory where the pipeline code is located.
- Modify the pipeline configuration (pipeline.yaml) as per your requirements, including the source repository, deployment stages, and approval settings.
- Configure AWS CLI and ensure it has the necessary permissions to create AWS resources.
- Push the code changes to the source repository to trigger the pipeline.
- The pipeline will execute the stages sequentially, and you will be prompted for manual approval before deploying the infrastructure.
- After the manual approval, Terraform will apply the changes and deploy the - infrastructure automatically.
- Monitor the pipeline execution and check for any errors or failures.
- Once the deployment is completed, you can access and utilize the deployed AWS infrastructure.
# Clean Up
To clean up and destroy the deployed infrastructure, follow these steps:

- Navigate to the pipeline configuration in AWS CodePipeline.
- Select the option to stop or delete the pipeline execution.
- Manually run terraform destroy with auto-approval to destroy the infrastructure.
    
```bash
  terraform destroy -auto-approve
```  
This will remove all the resources created by Terraform.
- Verify the resources have been destroyed by checking the AWS Management Console.
# Contributing
If you find any issues or have suggestions for improvements, feel free to open an issue or submit a pull request to this repository.

# License
This project is licensed under the MIT License.

Feel free to customize this README file based on your specific AWS CI/CD pipeline configuration and deployment process.

# Screenshots

<img width="960" alt="terraformp1" src="https://github.com/Simrankhott/Terraform-project-aws-vpc-module/assets/91006102/d1120da9-cb1f-4722-95c1-45a49fe638b9">
<img width="960" alt="terraformp2" src="https://github.com/Simrankhott/Terraform-project-aws-vpc-module/assets/91006102/7e60d00d-f37e-4b58-bfbf-fa604a2e8a58">

<img width="960" alt="terraformp3" src="https://github.com/Simrankhott/Terraform-project-aws-vpc-module/assets/91006102/723ceb7b-4c81-4846-8869-42c45febbb4f">
<img width="960" alt="terraformp4" src="https://github.com/Simrankhott/Terraform-project-aws-vpc-module/assets/91006102/c7778380-c980-4309-9e1d-414aafdad6e6">
