#!/bin/bash
set -x

echo "Downloading and extracting meson_cdn..."
wget 'https://staticassets.meson.network/public/meson_cdn/v3.1.20/meson_cdn-linux-amd64.tar.gz' && tar -zxf meson_cdn-linux-amd64.tar.gz && rm -f meson_cdn-linux-amd64.tar.gz && cd ./meson_cdn-linux-amd64 && sudo ./service install meson_cdn

echo "Configuring meson_cdn..."
cd ./meson_cdn-linux-amd64
sudo ./meson_cdn config set --token=flpzbbwkogddyofpab335c975434d950 --https_port=443 --cache.size=30

echo "Starting meson_cdn service..."
sudo ./service start meson_cdn
