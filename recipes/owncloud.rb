case node[:platform]
when 'debian'
  file "/etc/apt/sources.list.d/owncloud.list" do
    action "create_if_missing"
    content "deb http://download.opensuse.org/repositories/isv:ownCloud:devel/Debian_7.0/ /"
    notifies :run, "script[apt_get_key]", :immediately
  end
  
  script "apt_get_key" do
    action :nothing
    interpreter "bash"
    code "wget http://download.opensuse.org/repositories/isv:ownCloud:devel/Debian_7.0/Release.key -O- | apt-key add -; apt-get update"
  end
end

package "owncloud-client"

%w(share share/data share/data/ownCloud).each do |dir|
  directory "/home/#{node[:user]}/.local/#{dir}" do
    owner node[:user]
    group node[:user]
    recursive true
  end
end

cookbook_file "/home/#{node[:user]}/.local/share/data/ownCloud/owncloud.cfg" do
  action :create_if_missing
  owner node[:user]
  group node[:user]
  source 'owncloud.cfg'
  mode '0644'
end

# old owncloud config
# desktop_owncloud_mapping "Ikony" do
#   local  "/usr/local/share/images"
#   target "Ikony"
#   user   node[:user]
# end
#
# desktop_owncloud_mapping "Zvuky" do
#   local  "/usr/local/share/sounds"
#   target "Zvuky"
#   user   node[:user]
# end
#
# desktop_owncloud_mapping "Dokumenty" do
#   local  "/home/#{node[:user]}/Dokumenty"
#   target "Dokumenty"
#   user   node[:user]
# end
#
# desktop_owncloud_mapping "Obrazky" do
#   local  "/home/#{node[:user]}/Obrazky"
#   target "Obrazky"
#   user   node[:user]
# end
#
# desktop_owncloud_mapping "Poznamky" do
#   local  "/home/#{node[:user]}/Poznamky"
#   target "Poznamky"
#   user   node[:user]
# end
#
# desktop_owncloud_mapping "Certifikaty" do
#   local  "/home/#{node[:user]}/Certifikaty"
#   target "Certifikaty"
#   user   node[:user]
# end
