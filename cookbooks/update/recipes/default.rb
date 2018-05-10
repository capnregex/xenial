#
# Cookbook:: update
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

apt_update 'Update the apt cache daily' do
  frequency 86_400
  action :periodic
  ignore_failure true
end

