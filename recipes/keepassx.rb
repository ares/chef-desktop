install_dir = "/usr/local/src"
version = node[:desktop][:keepass][:version]
source = node[:desktop][:keepass][:source]

# install build dependencies
packages = %w(cmake)
case node[:platform]
  when "centos","redhat","fedora"
    packages.push *%w(qt-devel qt5-qtbase-devel libgcrypt-devel gcc-c++)
  else
    packages.push *%w(qt4-qmake libqt4-dev libgcrypt11-dev g++ zlib1g-dev)
end
packages.each {|p| package p}

remote_file "#{install_dir}/#{version}.tar.gz" do
  source "#{source}"
  notifies :run, 'script[compile-keepassx-2]', :immediately
  notifies :run, 'script[install-keepassx-2]', :immediately
end

# download, untar, compile
script "compile-keepassx-2" do
  interpreter "bash"
  user node[:user]
  group "staff"
  cwd install_dir
  action :nothing
  code <<-EOS
    tar xf #{version}.tar.gz
    cd #{version}
    mkdir -p build
    cd build
    cmake ..
    make
  EOS
end

# install compiled keepassx
script "install-keepassx-2" do
  interpreter "bash"
  cwd install_dir
  code "make install; rm -f /usr/local/bin/keepassx"
  action :nothing
end

link "/usr/bin/keepassx" do
  to "#{install_dir}/#{version}/build/src/keepassx"
end
