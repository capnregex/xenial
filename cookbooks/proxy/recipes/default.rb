# Cookbook:: proxy
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'yaml'

template '/etc/environment' do
  source 'environment.erb'
  mode '0644'
  owner 'root'
  group 'root'
end

template '/etc/apt/apt.conf' do
  source 'apt.conf.erb'
  mode '0644'
  owner 'root'
  group 'root'
end

