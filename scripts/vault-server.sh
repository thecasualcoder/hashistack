#! /bin/bash

set -e

cat <<-EOF > /tmp/vault.service
[Unit]
Description="HashiCorp Vault - A tool for managing secrets"
Documentation=https://vaultproject.io/docs/
Requires=network-online.target
After=network-online.target

[Service]
User=root
Group=root
ExecStart=/usr/bin/vault server -dev -dev-listen-address=192.168.1.200:8200 -dev-root-token-id=workshop
ExecReload=/bin/kill --signal HUP $MAINPID
CapabilityBoundingSet=CAP_SYSLOG CAP_IPC_LOCK
Capabilities=CAP_IPC_LOCK+ep
SecureBits=keep-caps
NoNewPrivileges=yes
KillSignal=SIGINT

[Install]
WantedBy=multi-user.target
EOF

sudo mv /tmp/vault.service /etc/systemd/system/vault.service

sudo systemctl daemon-reload
sudo systemctl enable vault
sudo systemctl start vault
sudo systemctl restart vault

echo 'systems dependencies installed'