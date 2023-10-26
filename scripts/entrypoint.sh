#!/usr/bin/env bash

echo ""
echo "#############################################################"
echo "#  Welcome to your AWS-SAM-enabled Java workspace!          #"
echo "#                                                           #"
echo "#  Before deploying, set a region to deploy to by running:  #"
echo "#  export AWS_DEFAULT_REGION=<region>                       #"
echo "#   (e.g.: export AWS_DEFAULT_REGION=eu-west-1)             #"
echo "#############################################################"
echo ""

exec "$@"
