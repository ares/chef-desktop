case node[:platform]
when 'debian'
  file "/etc/apt/sources.list.d/owncloud.list" do
    action "delete"
  end

  file "/etc/apt/sources.list.d/nextcloud.list" do
    action "create_if_missing"
    content "deb http://download.opensuse.org/repositories/home:/ivaradi//Debian_8.0/ /"
    notifies :run, "script[apt_get_key]", :immediately
  end

  script "apt_get_key" do
    action :nothing
    interpreter "bash"
    code "wget http://download.opensuse.org/repositories/home:/ivaradi//Debian_8.0/Release.key -O- | apt-key add -; apt-get update"
  end
end

package "owncloud-client" do
  action "remove"
end

package "nextcloud-client"

%w(share share/data share/data/Nextcloud).each do |dir|
  directory "/home/#{node[:user]}/.local/#{dir}" do
    owner node[:user]
    group node[:user]
    recursive true
  end
end

file "/home/#{node[:user]}/.local/share/data/ownCloud/owncloud.cfg" do
  action "delete"
end

template "/home/#{node[:user]}/.local/share/data/Nextcloud/nextcloud.cfg" do
  action :create_if_missing
  owner node[:user]
  group node[:user]
  source 'nextcloud.cfg.erb'
  mode '0644'
end
