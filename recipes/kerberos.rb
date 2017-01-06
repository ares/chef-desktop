cookbook_file "/home/#{node[:user]}/.kde/Autostart/kerberos_wallet.sh" do
  owner node[:user]
  group node[:user]
  mode 0755
  source "kerberos_wallet.sh"
  action node[:desktop][:kerberos][:enable] ? :create : :delete
end
