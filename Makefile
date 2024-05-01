az:
	az account show
i:
	terraform init
p:
	terraform plan -var-file=variables.tfvars
a:
	terraform apply -auto-approve -var-file=variables.tfvars
ar:
	terraform apply -refresh-only -auto-approve -var-file=variables.tfvars
d:
	terraform destroy -auto-approve -var-file=variables.tfvars
o:
	terraform output
c:
	terraform console
t2:
	terraform plan -var var_string=eri -var var_number=77
v:
	terraform validate
f:
	terraform fmt
s:
	terraform state list
rm:
	find .terraform* -exec rm -rf {} + ; find terraform.tfstate* -exec rm -rf {} +