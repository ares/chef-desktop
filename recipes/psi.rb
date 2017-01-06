package "psi-plus"
cookbook_file "/usr/share/psi-plus/iconsets/roster/freezy-facebook.jisp" do
  owner node[:user]
  group node[:user]
  source "freezy-facebook.jisp"
end
