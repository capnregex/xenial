# Cookbook:: proxy
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'yaml'

file '/etc/environment' do
  content <<~ENV
    PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
    TEST="Testing the ENV content"
    HOSTUSERNAME=#{ENV['USERNAME']}
    HOSTUSER=#{ENV['USER']}
    LANG=#{ENV['LANG']}
    http_proxy=#{ENV['http_proxy']}
    HTTP_PROXY=#{ENV['HTTP_PROXY']}
    https_proxy=#{ENV['https_proxy']}
    HTTPs_PROXY=#{ENV['HTTPS_PROXY']}
    no_proxy=#{ENV['no_proxy']}
    NO_PROXY=#{ENV['NO_PROXY']}
  ENV
  mode '0644'
  owner 'root'
  group 'root'
end

