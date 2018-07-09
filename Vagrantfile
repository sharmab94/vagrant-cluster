# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

# Require the reboot plugin.
require './vagrant-provision-reboot-plugin'
require 'yaml'
vagrantConfig = YAML.load_file 'Vagrantfile.config.yml'

Vagrant.configure("2") do |config|

  config.vm.define "redis_master" do |redis_master|
    redis_master.vm.box = "centos/7"
    redis_master.vm.network "public_network", bridge: "en0: Wi-Fi (AirPort)", ip: vagrantConfig['ip']
    redis_master.vm.network "forwarded_port", guest: 8500, host: 8500
    redis_master.vm.provision :shell, :path => "install_redis.sh"
    redis_master.vm.provision :shell, :path => "setup_master.sh"
    redis_master.vm.provision :shell, :path => "verify.sh"
    redis_master.vm.provision :shell, :path => "install_consul.sh"
  end

  config.vm.define "redis_slave1" do |redis_slave1|
    redis_slave1.vm.box = "centos/7"
    redis_slave1.vm.network "public_network", bridge: "en0: Wi-Fi (AirPort)"
    redis_slave1.vm.provision :shell, :path => "install_redis.sh"
    redis_slave1.vm.provision :shell, :path => "setup_slave.sh"
    redis_slave1.vm.provision :shell, :path => "verify.sh"
  end

  config.vm.define "redis_slave2" do |redis_slave2|
    redis_slave2.vm.box = "centos/7"
    redis_slave2.vm.network "public_network", bridge: "en0: Wi-Fi (AirPort)"
    redis_slave2.vm.provision :shell, :path => "install_redis.sh"
    redis_slave2.vm.provision :shell, :path => "setup_slave.sh"
    redis_slave2.vm.provision :shell, :path => "verify.sh"
  end

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--nicpromisc0", "allow-all"]
    vb.customize ["modifyvm", :id, "--nicpromisc1", "allow-all"]
    vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
    vb.customize ["modifyvm", :id, "--nicpromisc3", "allow-all"]
  end

  # Run a reboot of a *NIX guest.
  config.vm.provision :unix_reboot

end
