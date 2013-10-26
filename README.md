# fedora-commons cookbook

Installs and configures [Fedora Commons](http://www.fedora-commons.org), supporting:

* Apache Tomcat (embedded)
* Apache Derby (embedded)
* PostgreSQL
* MySQL
* Included [Vagrant](http://www.vagrantup.com) and [Berkshelf](http://berkshelf.com) files for easy VM creation

# Requirements
## Platform
Tested on Ubuntu 12.04 (precise)

## Cookbooks
Custom cookbooks:
* ubuntu-baseline (https://github.com/mjsuhonos/ubuntu-baseline)

Opscode cookbooks:
* java
* tomcat
* database
* mysql
* postgresql

# Usage

# Attributes

# Recipes
Include the Fedora recipe to install Fedora Commons on your system; this will also automatically start the server.

	include_recipe "fedora"
### Default
- install/configure Fedora Commons using embedded Derby as the database
### MySQL
- install/configure Fedora Commons using a MySQL instance on same node
### PostgreSQL
- install/configure Fedora Commons using a PostgreSQL instance on same node

# License
MIT License (<http://mit-license.org>)

# Author
Copyright © 2013 MJ Suhonos (<mjsuhonos@ryerson.ca>)