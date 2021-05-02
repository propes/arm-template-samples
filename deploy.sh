#!/bin/bash

if [ -z "$1" ]; then
    echo "Please specify the template name as an argument"
    exit 0
fi

rgName="rg-test-shared-uks"
rgLocation="UK South"
today=$(date +"%d-%b-%Y")
deploymentName="initialdeploy-"$today
templateFile=$1

set -x

az group create \
   --name $rgName \
   --location "$rgLocation"

az deployment group create \
   --name $deploymentName \
   --template-file $templateFile \
   --resource-group $rgName \
   --parameters appPlanName=coolbananas
