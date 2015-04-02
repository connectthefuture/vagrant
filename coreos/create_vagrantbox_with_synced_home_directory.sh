#!/bin/bash
cat > Vagrantfile << EOF
VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
config.vm.box = "coreos"
config.vm.box_url = "http://storage.core-os.net/coreos/amd64-generic/dev-channel/coreos_production_vagrant.box"
config.vm.synced_folder "$HOME", "/home/core/share", id: "core", :nfs => true,  :mount_options   => ['nolock,vers=3,udp']
config.vm.network "private_network",
ip: "192.168.97.79"
end
EOF
vagrant up

