#! /bin/sh
echo "Installing required packages..."
sudo apt-get update

# Other Packages required
sudo apt-get install unzip curl vim jq dnsutils dnsmasq -y

echo "server=/consul/127.0.0.1#8600" > /etc/dnsmasq.d/10-consul

sudo systemctl restart dnsmasq