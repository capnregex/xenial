#
# Cookbook:: proxy
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'yaml'

file '/etc/environment' do
  http_proxy = Chef::Config[:http_proxy] || ENV['http_proxy'] || ENV['HTTP_PROXY']
  https_proxy = Chef::Config[:https_proxy] || ENV['https_proxy'] || ENV['HTTPS_PROXY']
  no_proxy = Chef::Config[:no_proxy] || ENV['no_proxy'] || ENV['NO_PROXY']
  content <<~ENV
    PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
    TEST="Testing the ENV content"
    HOSTUSERNAME=#{ENV['USERNAME']}
    HOSTUSER=#{ENV['USER']}
    http_proxy=#{http_proxy}
    HTTP_PROXY=#{http_proxy}
    https_proxy=#{https_proxy}
    HTTPS_PROXY=#{https_proxy}
    no_proxy=#{no_proxy}
    NO_PROXY=#{no_proxy}
  ENV
  mode '0644'
  owner 'root'
  group 'root'
end

