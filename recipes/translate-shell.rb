remote_file "/home/#{node[:user]}/.bin/trans" do
  source 'http://git.io/trans'
  owner node[:user]
  group node[:user]
  mode '0755'
  creates "/home/#{node[:user]}/.bin/trans"
end

template "/home/#{node[:user]}/.oh-my-zsh/custom/translate-shell.plugin.zsh" do
  source "translate-shell.plugin.zsh.erb"
  mode "0644"
  owner node[:user]
  group node[:user]
end

