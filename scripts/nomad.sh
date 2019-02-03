#! /bin/sh
echo "Installing Nomad..."
sudo apt-get update

NOMAD_VERSION=0.8.7
cd /tmp/
curl -sSL https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip -o nomad.zip
unzip nomad.zip
sudo chmod +x nomad
sudo mv nomad /usr/bin/nomad
sudo mkdir -p /etc/nomad.d
sudo chmod a+w /etc/nomad.d
sudo rm -rf /tmp/nomad /tmp/nomad.zip