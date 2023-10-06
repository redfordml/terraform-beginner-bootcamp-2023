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
