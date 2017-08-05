case node[:platform]
  when "centos","redhat","fedora"
    # xorg server
    package 'xorg-x11-server-Xorg'
    # keyboard driver
    package 'xorg-x11-drv-evdev'
    # mouse driver
    package 'xorg-x11-drv-synaptics'
end

package 'sddm'
package 'konsole'
package 'kate'
package 'dolphin'
package 'kwalletmanager'
package 'clementine'
package 'gwenview'
package 'ark'
package 'okular'

case node[:platform_family]
  when 'debian'
    package 'iceweasel'
  else
    package 'firefox'
end

case node[:platform_family]
  when 'fodora', 'redhat', 'centos'
    package 'fuse-exfat'
end

case node[:desktop][:de][:environment]
  when 'kde'
    case node[:platform]
      when "centos","redhat","fedora"
        package 'plasma-desktop'
        package 'kdeplasma-addons'
        package 'plasma-nm-openvpn'
        package 'plasma-nm'
        service 'sddm' do
          action  :enable
        end
        # yum package can't install @kde-desktop
        script 'install_KDE' do 
          interpreter 'bash'
          code 'dnf install @kde-desktop'
          not_if 'rpm -q plasma-workspace'
        end
    end
  when 'razorqt'
    package 'razorqt'
  else
    raise "unsupported DE #{node[:desktop][:de]}"
end
