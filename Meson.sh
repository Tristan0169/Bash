#!/bin/bash

# Download and extract the apphub-linux-amd64.tar.gz
wget 'https://staticassets.meson.network/public/meson_cdn/v3.1.20/meson_cdn-linux-amd64.tar.gz' && tar -zxf meson_cdn-linux-amd64.tar.gz && rm -f meson_cdn-linux-amd64.tar.gz && cd ./meson_cdn-linux-amd64 && sudo ./service install meson_cdn

# Change directory to apphub-linux-amd64
cd ./meson_cdn-linux-amd64

# Configure meson_cdn
sudo ./meson_cdn config set --token=flpzbbwkogddyofpab335c975434d950 --https_port=443 --cache.size=30

# Start the meson_cdn service
sudo ./service start meson_cdn
