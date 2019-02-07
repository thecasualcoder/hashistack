#! /bin/bash

set -e

cat <<-EOF > /tmp/consul.service
[Unit]
Description="HashiCorp Consul - A service mesh solution"
Documentation=https://www.consul.io/
Requires=network-online.target
After=network-online.target

[Service]
User=root
Group=root
ExecStart=/usr/bin/consul agent -server -bootstrap-expect=1 -data-dir=/data/consul -config-dir=/etc/consul.d/ -bind=192.168.1.200 -client=192.168.1.200 -ui
ExecReload=/usr/local/bin/consul reload
KillMode=process
Restart=on-failure
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target
EOF


sudo mv /tmp/consul.service /etc/systemd/system/consul.service

sudo systemctl daemon-reload
sudo systemctl enable consul
sudo systemctl start consul
sudo systemctl restart consul

echo 'systems dependencies installed'