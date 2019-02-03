#! /bin/sh
echo "Installing Docker..."
sudo apt-get update
sudo apt-get remove docker docker-engine docker.io

# Packages to allow apt to use a repository over HTTPS:
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y

# Add Docker’s official GPG key
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg |  sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

# Set up the stable repository
sudo add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) \
      stable"

# Installing Docker CE
sudo apt-get update
sudo apt-get install docker-ce -y

# Restart docker to make sure we get the latest version of the daemon if there is an upgrade
sudo service docker restart

# Make sure we can actually use docker as the vagrant user
sudo usermod -aG docker vagrant
sudo docker --version
