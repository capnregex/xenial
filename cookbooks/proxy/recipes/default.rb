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
  variables(
    path_env: node['env']['path'],
    username: node['env']['username'],
    user: node['env']['user'],
    lang: node['env']['lang'],
    http_proxy: node['proxy']['http'],
    https_proxy: node['proxy']['https'],
    no_proxy: node['proxy']['no']
  )
end

template '/etc/apt/apt.conf' do
  source 'apt.conf.erb'
  mode '0644'
  owner 'root'
  group 'root'
  variables(
    http_proxy: node['proxy']['http'],
    https_proxy: node['proxy']['https']
  )
end

