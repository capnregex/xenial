# -*- mode: ruby -*-
# vi: set ft=ruby :

require_relative 'lib/proxy.rb'

proxy = Proxy.new ENV

Vagrant.configure("2") do |config|

  if Vagrant.has_plugin?("vagrant-proxyconf")
    config.proxy.http     = proxy.http
    config.proxy.https    = proxy.https
    config.proxy.no_proxy = proxy.no
  end

  config.vm.box = "bento/ubuntu-16.04"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    # vb.name = "xenial"
    vb.memory = "4096"
    # vb.cpus = 2
  end
  
  config.vm.provision "chef_zero", run: :always do |chef|
    chef.log_level = 'debug'

    chef.cookbooks_path = "cookbooks"
    chef.data_bags_path = "data_bags"
    chef.nodes_path = "nodes"
    chef.roles_path = "roles"

    chef.http_proxy = proxy.http
    chef.https_proxy = proxy.https
    chef.no_proxy = proxy.no

    chef.add_recipe "proxy"
    chef.add_recipe "ubuntu"
    chef.add_recipe "update"
    chef.add_recipe "xubuntu"
    chef.add_recipe "xubuntu::start"
  end
end
