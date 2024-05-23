#!/bin/bash

# Loop over each resource group
for (( i=1; i<=10; i++ )); do
    resource_group="michaelfav$i"
    
    # Loop over each VM in the current resource group
    for (( j=0; j<3; j++ )); do
        vm_name="michaelfav$j"
        
        # Execute az vm extension set command for the current VM
        az vm extension set \
            --resource-group $resource_group \
            --vm-name $vm_name \
            --name customScript \
            --publisher Microsoft.Azure.Extensions \
            --version 2.1 \
            --settings '{"fileUris":["https://raw.githubusercontent.com/Tristan0169/Bash/main/post.sh"]}' \
            --protected-settings '{"commandToExecute": "bash post.sh"}' \
            --no-wait
    done
done

