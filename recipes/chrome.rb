case node[:platform_family]
when 'debian', 'ubuntu'
  cookbook_file "/etc/apt/sources.list.d/chrome.list" do
    owner node[:user]
    group node[:user]
    mode '0644'
    source "chrome.list"
    action :create
    notifies :run, "script[chrome_gpg_key]", :immediately
  end

  script "chrome_gpg_key" do
    action :nothing
    interpreter "bash"
    code "wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -; apt-get update"
  end

  package "google-chrome-unstable"
when 'fedora', 'centos', 'redhat'
  cookbook_file '/etc/yum.repos.d/google-chrome.repo' do
    owner node[:user]
    group node[:user]
    mode '0644'
    source 'chrome.repo'
    action :create
  end

  package 'google-chrome-stable'
end
