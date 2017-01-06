desktop_startup_script 'ksshaskpass' do
  user    node[:user]
  content %Q(#!/bin/sh
sleep 60
ssh-add < /dev/null
)
end