#!/usr/bin/env bash
set -ex

curl --fail --location "https://awscli.amazonaws.com/awscli-exe-linux-aarch64-${AWS_CLI_VERSION}.zip" -o "awscliv2.zip"
unzip -q awscliv2.zip
sh ./aws/install
rm awscliv2.zip
rm -rf ./aws

pip install "aws-sam-cli==${AWS_SAM_VERSION}"
