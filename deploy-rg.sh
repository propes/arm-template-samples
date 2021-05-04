#!/bin/bash

# This script deploys a resource group to the currently active azure subscription.
#
# Usage:
#   sh deploy-rg.sh resource-group.json


if [ -z "$1" ]; then
    echo "Please specify the template name as an argument"
    exit 0
fi

location="uksouth"
templateFile=$1

set -x

az deployment sub create \
   --template-file $templateFile \
   --location $location
