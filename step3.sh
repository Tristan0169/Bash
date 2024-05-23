#!/bin/bash

# Loop through to update network security group rules in each resource group
for i in {1..10}
do
    # Set the name for the resource group
    rg_name="michaelfav${i}"

    # Update the NSG to allow traffic on ports 36060 and 443
    az network nsg rule create \
        --resource-group $rg_name \
        --nsg-name "michaelfavNSG" \
        --name allow_port_36060 \
        --priority 1001 \
        --protocol Tcp \
        --destination-port-ranges 36060 \
        --access Allow \
        --description "Allow inbound traffic on port 36060"

    az network nsg rule create \
        --resource-group $rg_name \
        --nsg-name "michaelfavNSG" \
        --name allow_port_443 \
        --priority 1002 \
        --protocol Tcp \
        --destination-port-ranges 443 \
        --access Allow \
        --description "Allow inbound traffic on port 443"

    echo "Network security group rules updated for $rg_name"
done

