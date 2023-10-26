#!/usr/bin/env bash
set -e

curl --fail --location "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${AWS_CLI_VERSION}.zip" -o "awscliv2.zip"
unzip -q awscliv2.zip
sh ./aws/install
rm awscliv2.zip
rm -rf ./aws

curl --fail --location "https://github.com/aws/aws-sam-cli/releases/download/v${AWS_SAM_VERSION}/aws-sam-cli-linux-x86_64.zip" -o "awssamcli.zip"
unzip awssamcli.zip -d ./sam-installation
sh ./sam-installation/install
rm -rf ./sam-installation
