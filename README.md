# Terraform Beginner Bootcamp 2023


## Semantic Versioning :mage:

This project is going to utilize semantic versioning for its taggin.
[semver.org](https://www.semver.org/)

The general format:

 **MAJOR.MINOR.PATCH**, eg. `1.0.1`

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes

## Install Terrafom CLI

The Terraform CLI installation instruction have chaged due to gpg keyring changes.
So we needed to refer to the lastest install cli documentation via Terraform website and change the scripting for installation.


[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)


## Refractoring into bash script

while fixing the terraform cli gpg depreciation issue, I notice thta bash steps were a considrable ammount more code. so we decided to create a bash script to install the Terrafrom CLI.

This bash script is located here:


- This will keep the gitpod task file ([.gitpod.yml](./gitpod.yml)) tidy. 
- This allow us an easier to debug and execute manually Terraform CLI install.
- this wil allow better portability for each projects that need to install Terraform CLI.




[](https://en.wikipedia.org/wiki/Shebang_(Unix))


