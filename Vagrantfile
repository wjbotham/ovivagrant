# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provider "virtualbox"
  config.vm.box = "hashicorp/precise64"

  config.vm.provision :shell, :path => "bootstrap/write-bash-profile.sh"
  config.vm.provision :shell, :path => "bootstrap/fetch-openvas-files.sh"
  config.vm.network "forwarded_port", guest: 9393, host: 9393
end
