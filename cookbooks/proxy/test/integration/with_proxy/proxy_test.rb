# # encoding: utf-8

# Inspec test for recipe proxy::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe file('/etc/environment') do
  context "default with proxy" do
    its('content') { is_expected.to match /PROXY=http.*example\.com/ }
  end
end

describe file('/etc/apt/apt.conf') do
  context "default with proxy" do
    its('content') { is_expected.to match /::Proxy.*example\.com/ }
  end
end

