case node[:platform]
when 'debian', 'ubuntu'
  package 'mpv'
when 'fedora', 'redhat', 'centos'
  script 'install rpmfusion' do
    creates '/etc/yum.repos.d/rpmfusion-free.repo'
    code <<-EOS
      yum install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-#{node[:platform_version]}.noarch.rpm
    EOS
  end
  package 'mpv'
when 'redhat', 'centos'
  log 'mpv unavailable' do
    message 'This platform is not supported for mpv player'
    level :warn
  end  
end

