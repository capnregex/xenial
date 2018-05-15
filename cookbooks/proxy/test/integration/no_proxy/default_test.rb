# # encoding: utf-8

# Inspec test for recipe proxy::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe file('/etc/environment') do
  context "default without proxy" do
    its('content') { is_expected.not_to match /PROXY=/ }
  end
end

describe file('/etc/apt/apt.conf') do
  context "default without proxy" do
    its('content') { is_expected.not_to match /::Proxy/ }
  end
end

