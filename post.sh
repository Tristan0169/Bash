#!/bin/bash

# Download the application package
curl -o apphub-linux-amd64.tar.gz https://assets.coreservice.io/public/package/60/app-market-gaga-pro/1.0.4/app-market-gaga-pro-1_0_4.tar.gz

# Extract the package
tar -zxf apphub-linux-amd64.tar.gz

# Remove the downloaded package
rm -f apphub-linux-amd64.tar.gz

# Navigate to the extracted directory
cd ./apphub-linux-amd64

# Remove any existing service
sudo ./apphub service remove

# Install the service
sudo ./apphub service install

# Start the service
sudo ./apphub service start

# Wait for 1 minute
sleep 60

# Set configuration for gaganode
sudo ./apps/gaganode/gaganode config set --token=hkvpolkoiytptsvy3a4ff04b8f244132

# Restart the apphub service
sudo ./apphub restart
