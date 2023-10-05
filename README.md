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

## Considerations for Linux Distribution
This project is built against Ubuntu.
Please consider checking your Linux Distribution and change accordingly to distribution needs

[How to check Linux Distribution](https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/)

***Example of checking OS version:***

``` sh
$ cat /etc/os-release 

PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
```

#### Refractoring into bash script

While fixing the terraform cli gpg depreciation issue, I notice thta bash steps were a considrable ammount more code. so we decided to create a bash script to install the Terrafrom CLI.

This bash script is located here: [./bin/install_terraform__cli](./bin/install_terraform_cli.sh)


- This will keep the gitpod task file ([.gitpod.yml](./gitpod.yml)) tidy. 
- This allow us an easier to debug and execute manually Terraform CLI install.
- this wil allow better portability for each projects that need to install Terraform CLI.


#### Shebang considerations

A shebang tells the bash script what program that will interpet the script. eg `#!/bin/bash`

This is the recomended version for bash: `#!/usr/bin/env bash`

- For portability for different OS distributions
- Will search the user's PATH for the bash executable


[Shebang](https://en.wikipedia.org/wiki/Shebang_(Unix))



#### Execution Consideration

When executing the bash script we can use the `./` shrthand notation to execute the bash script.

eg. `./bin/install-terraform_cli`

If we are using a script in gitpod.yml we need to a point the script to program to interpeter it.

eg. `./bin/install-terraform_cli`

#### Linux Permission Considerations

In order to make our bash scripts executable we need to change permission for the fix to be executable at user mode.


```sh
chmod u+x ~ ./bin/install-terraform_cli

```

alternatively:

```sh
chmod 744 ./bin/install-terraform_cli

```

[Linux Permission](https://www.geeksforgeeks.org/chmod-command-linux/)



### Github Lifecycle (Before, Initm, Command)

We need to be careful when using the Init because will not rerun if we restart an existing workspace.

[Gitpod Tasks Documentation](https://www.gitpod.io/docs/configure/workspaces/tasks)

### Working with Env Vars

#### env command

We can list all environment variables (Env Vars) using `env` command.


We can filter specific env vars using grep. eg. `env | grep AWS_`


#### Setting and Unsetting Env Vars


In the terminal we can set using `export DATAPREP='/home/user1/data.csv'`

In the terminal we unset using `unset DATAPREP`

We can set an env var temporarily when just running a command 


```sh

HELLO ='world' ./bin/print_message

```
Within a bash script we can set env without writing export. eg:


```sh
#!/usr/bin/env bash

HELLO='world'

echo $HELLO

```

#### Printing Env Var

We can print an Env Var using echo eg. `echo $HELLO`


#### Scoping of Env Vars

When you open a new bash terminal it will not be aware of Env Vars that you have set in another terminal.

If you want to Env Var to persist across all future bash terminals that are open you need to set Env Vars in your bash profile. eg. `.bash_profile`



#### Persisting Env Vars in Gitpod

We can persist Env Vars into Gitpod by storing them in Gitpod Secret Storage.


```sh

gp env HELLO='world'


```

All future Workspaces launched will set the env vars for all bsh terminals opened in those workspaces.

You can also set env vars in the  `.gitpod.yml` but this can only non-sensitive env vars.


### AWS CLI installation

AWS CLI is installed for the project via the bash script [`./bin/install_aws_cli`](./bin/install_aws_cli)


[Getting Started Install (AWS CLI)](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

[AWS Env Vars](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

We can check if  our AWS credentials is configure properly by running the following AWS CLI command:

```aws

aws sts get-caller-identity

```

if it's successful, you should see a Json payload return like this:


```json
{
     "UserId": "AAKJDKJSDHCWVJ4LY4",
     "Account": "8356465776845",
     "Arn": "arn:aws:iam::8356465776845:user/EXAMPLEUSER  "

}
```

We'll need to generate AWS credentials  from IAM user in order to use AWS CLI.


## Terrafom Basics


### Terraform Registry 

Terraform sources their providers and modules from terraform registry which are located at [Registry.terraform.io](https://registry.terraform.io/)


- **Providers** Is an interface to APIs that will allow to create resources in teraform.

- **Modules** Are a way to make large amount of terraform code modular, portable and sharable.

[Random Terraform provider](https://registry.terraform.io/providers/hashicorp/random/latest)

### Terraform Consle

We can see a list of all Terraform Commands by typing `terraform`

#### Terraform Init

`terraform init`

As the start of a new terraform project, we will run ` terraform init` to download the binaries for the terraform providers that w'll use in this project.


#### Terrafom Plan

`terraform apply`

This will generate out a changeset, about the state of our infrastructure and will be changed.
We can output this changesset ie. "plan" to be passed to an apply, but ofte you can just ingnore.


#### Terraform Apply

`terraform apply`


This will run a plan and pass the changeset to be executed by terraform. apply should prompt yes or no.


If we want to automatically approve an "apply", we can provide the auto approve flag eg. `terraform apply --auto-approve`

#### Terraform Destroy

`terraform destroy`

This will destroy resources.

you can also use the auto approve flag, to skip the approve prompt eg.

`--auto-approve`


#### Terrafom Lock File


`.terraform.lock.hcl` Contains the loked versioning the providers or modules that should be used with this project.

the terraform lock file should be commited to you version control system eg. Github.


#### Terraform State File

`.terraform.tfstate` Contains information about your current state of your infrastructure.

This file **should not be commited** to your VCS.

This file can contain sensitive data.

If you lose this file, you lose knowing state of your infrastructure.

`.terraform.tfstate.backup` Is the previous state file state.


#### Terraform Directory

`.terraform` Contains binaries of terraform providers.

### Issues with Terraform Cloud Login and Gitpod Workspac

When attempting to run `terraform login` It will launch in bash asking a vew to generate a token. You should select 
**Print** option and copy token generated in terraform clud.




We have automated this workaround with the following bash script [./bin/generate_tfrc_credentials](./bin/generate_tfrc_credentials)


#### Troubleshooting error trying to run `terraform apply` with CLI Driven Workflow


When I configure Terraform Cloud token in my Gitpod Global Env Vars, I tried to run a `tf apply` but throw me this error:


```terraform
error: No valid credential sources found
│ 
│   with provider["registry.terraform.io/hashicorp/aws"],
│   on <empty> line 0:
│   (source code not available)
│ 
│ Please see https://registry.terraform.io/providers/hashicorp/aws
│ for more information about providing credentials.
│ 
│ Error: failed to refresh cached credentials, no EC2 IMDS role found,
│ operation error ec2imds: GetMetadata, request canceled, context deadline
│ exceeded
│ 
╵
╷
│ Error: Invalid provider configuration
│ 
│ Provider "registry.terraform.io/hashicorp/aws" requires explicit
│ configuration. Add a provider block to the root module and configure the
│ provider's required arguments as described in the provider documentation.

```

***Solution***

Whe you configure `Terraform CLI Driven Workflow` access key that execute API calls to AWS are located in Teraform Cloud.

You have the Terraform token to comunicate with therraform cloud, the it execute the plan. configure those AWS Env Vars in terraform cloud now!!


