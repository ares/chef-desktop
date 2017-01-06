#
# Cookbook Name:: desktop
# Recipe:: default
#
# Copyright 2012, Ares
#
# All rights reserved
#
include_recipe "desktop::de" if node[:desktop][:de][:enable]
include_recipe "desktop::directories"
include_recipe "desktop::keepassx" if node[:desktop][:keepass][:enable]
include_recipe "desktop::chrome" if node[:desktop][:chrome][:enable]
include_recipe "desktop::mplayer" if node[:desktop][:mplayer][:enable]
include_recipe "desktop::owncloud" if node[:desktop][:owncloud][:enable]
include_recipe "desktop::psi" if node[:desktop][:psi][:enable]
include_recipe "desktop::ssh_keys" if node[:desktop][:ssh_keys][:enable]
include_recipe "desktop::synergy" if node[:desktop][:synergy][:enable]
include_recipe "desktop::gpg" if node[:desktop][:gpg][:enable]
include_recipe "desktop::translate-shell" if node[:desktop][:'translate-shell'][:enable]
include_recipe "desktop::scripts" if node[:desktop][:scripts][:enable]
include_recipe "desktop::kerberos" if node[:desktop][:kerberos][:enable]
include_recipe "desktop::kvirc" if node[:desktop][:kvirc][:enable]
