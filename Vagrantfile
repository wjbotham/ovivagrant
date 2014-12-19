# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provider "virtualbox"
  config.vm.box = "hashicorp/precise64"

  config.vm.provision :shell, :path => "bootstrap/install-dependencies.sh"
  config.vm.provision :shell, :path => "bootstrap/fetch-openvas-files.sh"
  config.vm.provision :shell, :path => "bootstrap/build-openvas-libraries.sh"
  config.vm.provision :shell, :path => "bootstrap/build-openvas-scanner.sh"
  config.vm.provision :shell, :path => "bootstrap/build-openvas-manager.sh"
  config.vm.provision :shell, :path => "bootstrap/build-greenbone-security-assistant.sh"
  config.vm.provision :shell, :path => "bootstrap/build-openvas-cli.sh"
  config.vm.provision :shell, :path => "bootstrap/start.sh"
  config.vm.provision :shell, :path => "bootstrap/feed-archivist.sh", :args => "restore"
  config.vm.provision :shell, :path => "bootstrap/setup.sh"
  config.vm.provision :shell, :path => "bootstrap/feed-archivist.sh", :args => "save"
  #config.vm.provision :shell, :path => "bootstrap/create-admin-password.sh"
  config.vm.network "forwarded_port", guest: 443, host: 9392
end
