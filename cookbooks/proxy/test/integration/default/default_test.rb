# # encoding: utf-8

# Inspec test for recipe proxy::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe file('/etc/environment') do
  its('content') { is_expected.to match /^HTTP_PROXY=/ }
end
