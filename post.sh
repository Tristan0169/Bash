#!/bin/bash

# Download and extract the apphub-linux-amd64.tar.gz
curl -o apphub-linux-amd64.tar.gz https://assets.coreservice.io/public/package/60/app-market-gaga-pro/1.0.4/app-market-gaga-pro-1_0_4.tar.gz && tar -zxf apphub-linux-amd64.tar.gz && rm -f apphub-linux-amd64.tar.gz

# Change directory to apphub-linux-amd64
cd ./apphub-linux-amd64

# Stop the apphub service
sudo ./apphub service remove

# Install the apphub service
sudo ./apphub service install

# Start the apphub service
sudo ./apphub service start

# Wait for 1 minute
sleep 60

# Configure gaganode
sudo ./apps/gaganode/gaganode config set --token=hkvpolkoiytptsvy3a4ff04b8f244132

# Restart the apphub service
sudo ./apphub restart
