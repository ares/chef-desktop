directory "/home/#{node[:user]}/.gnupg" do
  owner node[:user]
  group node[:user]
  mode 0700
end

cookbook_file "/home/#{node[:user]}/.gnupg/gpg.conf" do
  owner node[:user]
  group node[:user]
  mode  0600
  source "gpg.conf"
end

desktop_startup_script 'gpgagent' do
  user    node[:user]
  content %Q(#!/bin/sh
killall gpg-agent > /dev/null 2>&1
eval `gpg-agent --daemon`
)
end

