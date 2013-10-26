#
# Cookbook Name:: fedora-commons
# Recipe:: postgresql
#
# Copyright (C) 2013 MJ Suhonos
# 
# MIT License <http://mit-license.org>
#

# install postgresql
include_recipe 'postgresql'
include_recipe 'postgresql::server'
include_recipe 'database::postgresql'

# define the database connection
postgres_connection = ({
  :host => node[:postgresql][:config][:listen_addresses],
  :username => 'postgres',
  :password => node[:postgresql][:password][:postgres]})

# create the fedora postgresql database
postgresql_database node[:fedora][:database][:name] do
  connection postgres_connection
  action :create
end

# create the fedora postgresql user
postgresql_database_user node[:fedora][:database][:username] do
  connection postgres_connection
  password node[:fedora][:database][:password]
  action :create
end

# grant permissions to localhost
postgresql_database_user node[:fedora][:database][:username] do
  connection postgres_connection
  password node[:fedora][:database][:password]
  database_name node[:fedora][:database][:name]
  host node[:postgresql][:config][:listen_addresses]
  action :grant
end

# install fedora
include_recipe 'fedora::default'