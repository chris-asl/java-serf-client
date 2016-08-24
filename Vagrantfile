# -*- mode: ruby -*-
# vi: set ft=ruby :

# Creates two nodes, downloads or copies "serf.zip" from local dir (if it exists), unzips it, installs it in /usr/local/bin and exec's it.
# Note: Serf nodes need to *explicitly* join a cluster.

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

SERF_ZIP="serf.zip"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.provision "file", source: "serf-agent.conf", destination: "./serf-agent.conf"
  if File.file?(SERF_ZIP)
        config.vm.provision "file", source: "serf.zip", destination: "./serf.zip"
  else 
        config.vm.provision "shell", path: "download-serf.sh"
  end
  config.vm.provision "shell", path: "provision.sh"

  config.vm.define "serf1" do |serf1|
    serf1.vm.hostname = "serf1"
    serf1.vm.network "private_network", ip: "10.2.2.10"
    serf1.vm.network "forwarded_port", guest: 7373, host: 7373
  end

  config.vm.define "serf2" do |serf2|
    serf2.vm.hostname = "serf2"
    serf2.vm.network "private_network", ip: "10.2.2.11"
    serf2.vm.network "forwarded_port", guest: 7373, host: 7374
  end
end
