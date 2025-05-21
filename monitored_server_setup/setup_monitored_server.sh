#!/bin/bash
# Script khởi động node_exporter
NODE_EXPORTER_VERSION="1.7.0"
ARCH="linux-amd64"
DOWNLOAD_URL="https://github.com/prometheus/node_exporter/releases/download/v$NODE_EXPORTER_VERSION/node_exporter-$NODE_EXPORTER_VERSION.$ARCH.tar.gz"
echo "Tải node_exporter..."
wget $DOWNLOAD_URL -O node_exporter.tar.gz
echo "Giải nén..."
tar -xzf node_exporter.tar.gz
mkdir -p ./node_exporter
mv node_exporter-$NODE_EXPORTER_VERSION.$ARCH/* ./node_exporter/
rm -rf node_exporter-$NODE_EXPORTER_VERSION.$ARCH node_exporter.tar.gz
echo "Khởi chạy node_exporter..."
nohup ./node_exporter/node_exporter > /dev/null 2>&1 &
echo "Hoàn tất. Đang chạy tại port 9100."
