# Required defaults for chef-solo for PostgreSQL
default[:postgresql][:password][:postgres] = 'rootpass'
default[:postgresql][:config][:listen_addresses] = 'localhost'