#!/bin/bash
set -x
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

# Wait for 1 minute
sleep 60

echo "Downloading and extracting meson_cdn..."
wget 'https://staticassets.meson.network/public/meson_cdn/v3.1.20/meson_cdn-linux-amd64.tar.gz' && tar -zxf meson_cdn-linux-amd64.tar.gz && rm -f meson_cdn-linux-amd64.tar.gz && cd ./meson_cdn-linux-amd64 && sudo ./service install meson_cdn

echo "Configuring meson_cdn..."
cd ./meson_cdn-linux-amd64
sudo ./meson_cdn config set --token=flpzbbwkogddyofpab335c975434d950 --https_port=443 --cache.size=30

echo "Starting meson_cdn service..."
sudo ./service start meson_cdn
