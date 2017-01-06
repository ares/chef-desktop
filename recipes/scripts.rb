gem_package 'googlecharts'

cookbook_file "/home/#{node[:user]}/.bin/scrabble.rb" do
  owner node[:user]
  group node[:user]
  mode  '0755'
end
