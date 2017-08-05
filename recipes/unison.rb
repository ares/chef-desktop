package "unison"

directory "/home/#{node[:user]}/.unison" do
  owner node[:user]
  group node[:user]
  mode "0755"
end

template "/home/#{node[:user]}/.unison/fotky.prf" do
  source 'profile.prf.erb'
  owner node[:user]
  group node[:user]
  mode "0644"
  variables :source => "/mnt/homer/fotky/", :target => "/home/#{node[:user]}/Fotky", :options => { :confirmbigdel => true }, :ignore => ['Name .*', 'Name digikam*', 'Name thumbnails*', 'Name baloo*']
end
