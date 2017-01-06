directory "/home/#{node[:user]}/.config/KVIrc/config" do
  owner node[:user]
  group node[:user]
  mode '0755'
  recursive true
end

directory "/home/#{node[:user]}/.config/KVIrc" do
  owner node[:user]
  group node[:user]
  mode '0755'
end

%w(serverdb.kvc main.kvc winproperties.kvc).each do |config_file|
  cookbook_file "/home/#{node[:user]}/.config/KVIrc/config/#{config_file}" do
    source config_file 
    owner node[:user]
    group node[:user]
    mode '0644'
    action :create_if_missing
  end
end

package 'kvirc'
