#! /bin/sh

set -e

echo "Installing Nomad..."

NOMAD_VERSION=0.8.7
cd /tmp/
curl -sSL https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip -o nomad.zip
unzip nomad.zip
sudo chmod +x nomad
sudo mv nomad /usr/bin/nomad
sudo mkdir -p /etc/nomad.d
sudo chmod a+w /etc/nomad.d
sudo rm -rf /tmp/nomad /tmp/nomad.zip

echo "Installing http-echo"
curl -sSL https://github.com/hashicorp/http-echo/releases/download/v0.2.3/http-echo_0.2.3_linux_amd64.zip -o http-echo.zip
unzip http-echo.zip
sudo mv http-echo /usr/local/bin
