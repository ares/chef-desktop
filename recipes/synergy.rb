package "synergy"

if node[:synergy][:server]
  cookbook_file "/home/#{node[:user]}/.synergy.conf" do
    source "synergy.conf"
    owner node[:user]
    group node[:user]
  end

  desktop_startup_script 'synergys' do
    user    node[:user]
    content "synergys"
  end
end