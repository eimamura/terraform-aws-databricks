az:
	az account show
i:
	terraform init
p:
	terraform plan
a:
	terraform apply -auto-approve
ar:
	terraform apply -refresh-only -auto-approve
d:
	terraform destroy -auto-approve
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