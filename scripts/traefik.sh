#! /bin/sh
echo "Installing Traefik..."

# Install traefik
wget http://github.com/containous/traefik/releases/download/v1.7.9/traefik_linux-amd64 -O traefik
sudo chmod +x ./traefik
sudo mv traefik /usr/bin/
