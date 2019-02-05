#! /bin/sh
echo "Installing Consul..."

CONSUL_VERSION=1.4.0
cd /tmp/
curl -sSL https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip > consul.zip
unzip consul.zip
sudo chmod +x consul
sudo mv consul /usr/bin/consul
sudo mkdir -p /etc/consul.d
sudo chmod a+w /etc/consul.d
sudo rm -rf /tmp/consul /tmp/consul.zip