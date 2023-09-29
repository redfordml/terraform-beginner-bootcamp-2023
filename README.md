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






