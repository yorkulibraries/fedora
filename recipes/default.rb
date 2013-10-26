#
# Cookbook Name:: fedora-commons
# Recipe:: default
#
# Copyright (C) 2013 MJ Suhonos
# 
# MIT License <http://mit-license.org>
#

# Install Tomcat as service container
include_recipe 'java'
include_recipe 'tomcat'

# Download Fedora installer
remote_file "#{Chef::Config[:file_cache_path]}/fcrepo-installer.jar" do
  source "http://downloads.sourceforge.net/project/fedora-commons/fedora/#{node[:fedora][:version]}/fcrepo-installer-#{node[:fedora][:version]}.jar"
  mode "0644"
  checksum node[:fedora][:sha256]
  action :create_if_missing
end

# Generate templated install properties
template "template install.properties" do
  source "install.properties.erb"
  path "#{Chef::Config[:file_cache_path]}/install.properties"
  mode "0644"
end

# Install Fedora using templated properties
execute "install fedora" do
  command "java -jar #{Chef::Config[:file_cache_path]}/fcrepo-installer.jar #{Chef::Config[:file_cache_path]}/install.properties"
  creates "#{node[:fedora][:installpath]}/server/config/fedora.fcfg"
  action :run
end

# Set ownership of Fedora directory tree to Tomcat user
execute "set tomcat ownership" do
  command "chown -R #{node[:tomcat][:user]}:#{node[:tomcat][:group]} #{node[:fedora][:installpath]}"
end