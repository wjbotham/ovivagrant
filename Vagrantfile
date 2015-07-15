# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
  end
  config.vm.box = "ubuntu/trusty64"

  # vagrant-cachier is a plugin that keeps packages around so you don't have
  # to download them from our poor benighted providers over and over and over
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

  config.vm.provision :shell, :path => "bootstrap/install-dependencies.sh"
  config.vm.provision :shell, :path => "bootstrap/download-openvas-files.sh"
  config.vm.provision :shell, :path => "bootstrap/build-openvas-libraries.sh"
  config.vm.provision :shell, :path => "bootstrap/build-openvas-scanner.sh"
  config.vm.provision :shell, :path => "bootstrap/build-openvas-manager.sh"
  config.vm.provision :shell, :path => "bootstrap/build-greenbone-security-assistant.sh"
  config.vm.provision :shell, :path => "bootstrap/build-openvas-cli.sh"
  config.vm.provision :shell, :path => "bootstrap/feed-archivist.sh", :args => "restore"
  config.vm.provision :shell, :path => "bootstrap/make-certs.sh"
  config.vm.provision :shell, :path => "bootstrap/start-scanner.sh", :run => "always"
  config.vm.provision :shell, :path => "bootstrap/sync.sh"
  config.vm.provision :shell, :path => "bootstrap/feed-archivist.sh", :args => "save"
  config.vm.provision :shell, :path => "bootstrap/set-up-manager.sh"
  config.vm.provision :shell, :path => "bootstrap/start-manager-and-gsa.sh", :run => "always"
  config.vm.provision :shell, :path => "bootstrap/create-admin-password.sh"
  config.vm.provision :shell, :path => "bootstrap/report.sh", :run => "always"
  config.vm.network "forwarded_port", guest: 443, host: 9392
end
