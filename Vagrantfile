$script = <<SCRIPT
echo "Installing Docker..."
sudo apt-get update
sudo apt-get remove docker docker-engine docker.io
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg |  sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) \
      stable"
sudo apt-get update
sudo apt-get install -y docker-ce
# Restart docker to make sure we get the latest version of the daemon if there is an upgrade
sudo service docker restart
# Make sure we can actually use docker as the vagrant user
sudo usermod -aG docker vagrant
sudo docker --version
# Packages required for nomad & consul
sudo apt-get install unzip curl vim -y
SCRIPT

Vagrant.configure(2) do |config|
	config.vm.box = "ubuntu/xenial64" # 16.04 LTS
	config.vm.provision "shell", inline: $script, privileged: false

	config.vm.define "node-1", primary: true do |node|
		node.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
		end

		node.vm.network "private_network", ip: "192.168.1.100"
	end
end