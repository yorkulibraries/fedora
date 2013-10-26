=begin
# set database type to postgresql
default[:fedora][:database][:type] = 'postgresql'

# Required defaults for chef-solo for PostgreSQL
default[:postgresql][:password][:postgres] = 'rootpass'
default[:postgresql][:config][:listen_addresses] = 'localhost'
=end