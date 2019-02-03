VAGRANTFILE_API_VERSION = "2"
NUM_OF_NODES = 3

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 2
  end
  config.vm.provision :shell, inline: "echo 'Hello World!'"
  config.vm.provision :shell, path: "./scripts/basic.sh"
  config.vm.provision :shell, path: "./scripts/docker.sh"

  (1..NUM_OF_NODES).each do |i|
    config.vm.define "node#{i}" do |node|
      node.vm.network "private_network", ip: "192.168.1.#{i+1}"
      node.vm.provision :shell, inline: "echo 'Hello from node#{i}'"
    end
  end
end