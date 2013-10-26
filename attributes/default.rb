# Version of Fedora Commons to install
default[:fedora][:version] = '3.7.0'
default[:fedora][:sha256] = '40d3fe844cf8d20d9556e369792d162c2eb54c46274126da6734db09d0a3521c'

# System-specific Fedora root path
default[:fedora][:installpath] = '/usr/share/fedora'

# Default install.properties values
default[:fedora][:context] = 'fedora'
default[:fedora][:adminpassword] = 'fedoraAdmin'

# Database connection information; use built-in Derby by default
default[:fedora][:database][:type] = 'derby'
default[:fedora][:database][:name] = 'fedora3'
default[:fedora][:database][:username] = 'fedoraAdmin'
default[:fedora][:database][:password] = 'fedoraAdmin'