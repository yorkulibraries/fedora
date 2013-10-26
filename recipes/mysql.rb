#
# Cookbook Name:: fedora-commons
# Recipe:: mysql
#
# Copyright (C) 2013 MJ Suhonos
# 
# MIT License <http://mit-license.org>
#

# install mysql
include_recipe 'mysql::server'
include_recipe 'database::mysql'

# define the database connection
mysql_connection = ({
  :host => node[:mysql][:bind_address],
  :username => 'root',
  :password => node[:mysql][:server_root_password]})

# create the fedora mysql database
mysql_database node[:fedora][:database][:name] do
  connection mysql_connection
  action :create
end

# create the fedora mysql user
mysql_database_user node[:fedora][:database][:username] do
  connection mysql_connection
  password node[:fedora][:database][:password]
  action :create
end

# grant permissions to localhost
mysql_database_user node[:fedora][:database][:username] do
  connection mysql_connection
  password node[:fedora][:database][:password]
  database_name node[:fedora][:database][:name]
  host node[:mysql][:bind_address]
  action :grant
end

# set database type to mysql
node.default[:fedora][:database][:type] = 'mysql'

# install fedora
include_recipe 'fedora-commons::default'