#!/bin/bash

# Define an array of Azure regions
regions=("eastus" "westus" "centralus" "northcentralus" "southcentralus" "eastus2" "westus2" "northeurope" "westeurope" "southeastasia")

# Loop through to create virtual machines in each resource group
for i in {1..10}
do
    # Set the name for the resource group
    rg_name="michaelfav${i}"

    # Create the virtual machine
    az vm create --name michaelfav --resource-group $rg_name --image Ubuntu2204 --location ${regions[$((i-1))]} --public-ip-sku Standard --size Standard_B1ls --count 3 --no-wait 
       
    echo "Virtual machine creation in $rg_name started"

 
done


