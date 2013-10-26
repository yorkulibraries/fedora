# Required defaults for chef-solo for MySQL
default[:mysql][:server_root_password] = 'rootpass'
default[:mysql][:server_repl_password] = 'replpass'
default[:mysql][:server_debian_password] = 'debpass'
default[:mysql][:bind_address] = 'localhost'