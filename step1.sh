#!/bin/bash

# Define an array of Azure regions
regions=("eastus" "westus" "centralus" "northcentralus" "southcentralus" "eastus2" "westus2" "northeurope" "westeurope" "southeastasia")

# Loop through to create 10 resource groups with different regions
for i in {1..10}
do
    # Set the name for the resource group
    rg_name="michaelfav${i}"

    # Get the region for this iteration
    region="${regions[$((i-1))]}"

    # Create the resource group
    az group create --name $rg_name --location $region

    echo "Resource group $rg_name created in $region"
done
