#!/bin/bash

# Cài đặt Node Exporter
useradd -rs /bin/false node_exporter
wget https://github.com/prometheus/node_exporter/releases/download/v1.8.0/node_exporter-1.8.0.linux-amd64.tar.gz
tar xvf node_exporter-*.tar.gz
cp node_exporter-*/node_exporter /usr/local/bin/

cp node_exporter.service /etc/systemd/system/node_exporter.service
systemctl daemon-reexec
systemctl enable --now node_exporter

# Cài đặt Promtail
wget https://github.com/grafana/loki/releases/download/v2.9.2/promtail-linux-amd64.zip
unzip promtail-linux-amd64.zip
chmod +x promtail-linux-amd64
mv promtail-linux-amd64 /usr/local/bin/promtail

cp promtail-config.yaml /etc/promtail-config.yaml
cp promtail.service /etc/systemd/system/promtail.service

systemctl daemon-reexec
systemctl enable --now promtail