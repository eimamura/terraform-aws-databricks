# terraform-aws-databricks
This repository contains Terraform code for deploying and configuring Databricks E2 (Enterprise Edition ) architecture on AWS

Databricks provides 4 main deployment models they are:

Public Cloud Deployment Model: Databricks can be deployed on public cloud platforms such as AWS, Azure, and Google Cloud Platform. This is the most common deployment model for Databricks and provides a scalable and flexible environment for data processing.
Private Virtual Cloud Deployment Model: Databricks can also be deployed in a private virtual cloud, such as a VMware-based virtualized environment. This deployment model provides greater control and security over the Databricks environment.
Enterprise Edition (E2) Deployment Model: The E2 deployment model provides a highly scalable and multi-tenant environment for Databricks. It includes advanced features such as Delta Lake, automated machine learning, and advanced security and governance features.
Single Tenant Deployment Model: The single-tenant deployment model allows organizations to deploy Databricks in a dedicated environment, providing greater control and isolation over the Databricks environment. This deployment model is well-suited for organizations with strict security or compliance requirements.

Reference: https://community.databricks.com/t5/data-engineering/what-is-the-difference-between-single-tenant-and-e2-architecture/td-p/18347

# Commands

```bash
aws configure
aws configure list
aws iam get-user
aws iam list-users
```

```bash
terraform apply
terraform destroy
terraform apply -auto-approve
terraform apply -refresh-only -auto-approve
terraform destroy -auto-approve
terraform output my-vm-public-ip
terraform console
terraform output -json
TF_LOG=DEBUG terraform apply
terraform providers
```

```bash
ssh -i ec2_public_keypair.pem ec2-user@xxx.xxx.xxx.xxx
ping xxx.xxx.xxx.xxx

scp -i ec2_public_keypair.pem ec2_public_keypair.pem ec2-user@xxx.xxx.xxx.xxx:~/
chmod 400 ec2_public_keypair.pem
```

```bash
sudo amazon-linux-extras install nginx1
sudo systemctl start nginx.service
sudo systemctl enable nginx
systemctl status nginx

```

```bash
find .terraform*
find .terraform* -exec rm -rf {} +

find terraform.tfstate*
find terraform.tfstate* -exec rm -rf {} +
```

