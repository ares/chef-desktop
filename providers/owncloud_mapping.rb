action :create do
  %w(share share/data share/data/ownCloud).each do |dir|
    directory "/home/#{new_resource.user}/.local/#{dir}" do
      owner new_resource.user
      group new_resource.user
      recursive true
    end
  end

  directory "/home/#{new_resource.user}/.local/share/data/ownCloud/folders/" do
    owner new_resource.user
    group new_resource.user
    recursive true
  end

  template "/home/#{new_resource.user}/.local/share/data/ownCloud/folders/#{new_resource.name}" do
    source "owncloud_mapping.erb"
    owner new_resource.user
    group new_resource.user
    variables  :local_path => new_resource.local, :target => new_resource.target, :name => new_resource.name
  end
end

action :delete do
  file "/home/#{new_resource.user}/.local/share/data/ownCloud/folders/#{new_resource.name}" do
    action :delete
  end
end
