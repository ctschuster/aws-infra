# Repo "aws-infra"

Demo Infrastructure for AWS


## Description

The purpose of this repo is to demonstrate the expressive power of terraform
for development of IaC and also a model of infrastructure to be used in AWS.
The development and public availability of this repo has grown out of coaching /
training efforts.


## Limitations

Actual deployment of the AWS structure contained herein requires an AWS account
and specifics like account names, account numbers, perhaps dns & server names, etc.
Some of these will be treated documentation, but the principal purpose of this
repo is for demonstrating infrastructure and development patterns.  To maintain
this as ready-to-deploy is presently a secondary consideration but should be
achieved by the time of maturation of the codebase.


## Procedure

The procedure for deploying this infrastructure would resemble the following:

    export AWS_ACCESS_KEY_ID=<aws-key-id>
    export AWS_SECRET_ACCESS_KEY=<aws-secret-key>

    cd <repo>/01-basics
    terraform init
    # edit main.tf and comment out the backend section
    terraform plan  -target module.essentials.aws_dynamodb_table.lock-table \
                    -target aws_s3_bucket.logs
    terraform apply -target module.essentials.aws_dynamodb_table.lock-table \
                    -target aws_s3_bucket.logs
    
    # edit main.tf and restore the backend section, also provide a value for <account-alias>
    # edit variables.tf and provide a default value for account_alias
    terraform init
    terraform plan
    terraform apply
    
    cd <repo>/02-main
    # edit main.tf and provide a value for <account-alias>
    terraform init
    terraform plan
    terraform apply


## History

2020-03-20  Created as a public repo:  https://github.com/ctschuster/aws-infra
