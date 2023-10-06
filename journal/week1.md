# Terraform Beginner Bootcamp 2023 - Week 1

## Root Module Structure

Our root module structure is as follow:


```
PROJECT_ROOT
|
├── main.tf               - Everything else.
├── variables.tf          - Stores the structure of input variables
├── providers.tf          - Define required providers and their configuration.
├── outputs.tf            - Stores our outputs.
└── Terraform.tfvars      - The data of variables we want to load into our Terraform project
```
[Standar Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)


### Terraform Cloud Variables

In Terraform you can set two types of variables:

- Enviroment Variables - Those you would set in your bash terminal eg. AWS credentials.
- Terraform Variables  - Those that you normally set in your .tfvars file.

We can set Terraform Cloud Variables to be sensitive, so they are not shown visibly in the UI.

### Loading Terraform Variables

[Terraform Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)


### Var Flag

We can use the `-var` flag to set an input variable or override a variable in the tfvars file eg. `terraform plan -var user_uuid="my-user_id"`


### Var-File Flag

-TODO: Document this.


### Terraform.tfvars

This is the default dile to load in teraform variable in blank


### Auto.tfvars


-TODO: Document this functionality for terraform cloud


### Order of terraform variables


TODO: documetn whic terraform variables took presence
