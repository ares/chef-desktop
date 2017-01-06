directories = %W(
  /usr/local/share/images
  /usr/local/share/sounds
  /home/#{node[:user]}/Hudba
  /home/#{node[:user]}/Poznamky
  /home/#{node[:user]}/Poznamky/Todo
  /home/#{node[:user]}/Obrazky
  /home/#{node[:user]}/Dokumenty
  /home/#{node[:user]}/Certifikaty
  /home/#{node[:user]}/.bin
)

directories.each do |dir|
  directory dir do
    owner node[:user]
    group node[:user]
  end
end
