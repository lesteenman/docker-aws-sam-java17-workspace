#!/usr/bin/env bash
set -e

curl --fail --location "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sh ./aws/install
rm -rf /tmp/cli-installation

curl --fail --location "https://github.com/aws/aws-sam-cli/releases/latest/download/awscli-exe-linux-aarch64.zip" -o "awssamcli.zip"
unzip awssamcli.zip -d ./sam-installation
sh ./install
rm -rf /tmp/sam-installation
