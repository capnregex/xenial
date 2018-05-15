#
# Cookbook:: proxy
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'proxy::default' do
  context 'When all attributes are default, on Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'creates /etc/environment' do
      expect(chef_run).to create_template('/etc/environment').with(
        source: 'environment.erb',
        mode: '0644',
        owner: 'root',
        group: 'root'
      )
    end

    it 'creates /etc/apt/apt.conf' do
      expect(chef_run).to create_template('/etc/apt/apt.conf').with(
        source: 'apt.conf.erb',
        mode: '0644',
        owner: 'root',
        group: 'root'
      )
    end

  end

end

