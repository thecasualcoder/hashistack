VAGRANTFILE_API_VERSION = "2"
NUM_OF_NODES = 3

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 2
  end
  config.vm.provision :shell, inline: "echo 'Hello World!'"
  config.vm.provision "basic", type: "shell", path: "./scripts/basic.sh"
  config.vm.provision "docker", type: "shell", path: "./scripts/docker.sh"
  config.vm.provision "consul", type: "shell", path: "./scripts/consul.sh"
  config.vm.provision "nomad", type: "shell", path: "./scripts/nomad.sh"

  NUM_OF_NODES.times do |i|
    config.vm.define "node#{i}" do |node|
      node.vm.hostname = "node#{i}"
      node.vm.network "private_network", ip: "192.168.1.#{i+100}"
      node.vm.provision :shell, inline: "echo 'Hello from node#{i}'"
    end
  end
end