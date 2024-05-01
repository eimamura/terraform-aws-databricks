# terraform-on-aws-databricks
This repository contains Terraform code for deploying and configuring Databricks E2 architecture on AWS

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

