action :create do
  directory "/home/#{new_resource.user}/.kde/Autostart/" do
    owner new_resource.user
    group new_resource.user
    recursive true
  end

  file "/home/#{new_resource.user}/.kde/Autostart/#{new_resource.name}.sh" do
    owner new_resource.user
    group new_resource.user
    mode 0755
    action :create
    content new_resource.content
  end

  if node[:de] == "razorqt"
    directory "/home/#{new_resource.user}/.config/autostart" do
      owner new_resource.user
      group new_resource.user
      recursive true
    end

    file "/home/#{new_resource.user}/.config/autostart/#{new_resource.name}.desktop" do
      owner new_resource.user
      group new_resource.user
      action :create
      content %Q([Desktop Entry]
  Exec=/home/#{new_resource.user}/.kde/Autostart/#{new_resource.name}.sh
  Name=#{new_resource.name}
  OnlyShowIn=Razor;
  Type=Application
  Version=1.0
  )
    end
  end
end

action :delete do
  file "/home/#{new_resource.user}/.kde/Autostart/#{new_resource.name}.sh" do
    action :delete
  end

  if node[:de] == "razorqt"
    file "/home/#{new_resource.user}/.config/autostart/#{new_resource.name}.desktop" do
        action :delete
      end
  end
end
