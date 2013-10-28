# fedora-commons cookbook

Installs and configures [Fedora Commons](http://www.fedora-commons.org), supporting:

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
__TODO__

# Attributes
__TODO__

# Recipes
Include the 'default' recipe to install Fedora Commons on your system.

	include_recipe "fedora-commons::default"
#### Default
- install/configure Fedora Commons using embedded Derby as the database

#### MySQL
- install/configure Fedora Commons using a MySQL instance on same node

#### PostgreSQL
- install/configure Fedora Commons using a PostgreSQL instance on same node

# How to

Vagrant example (assumes Virtualbox & Vagrant are installed)

1. `git clone https://github.com/mjsuhonos/fedora-cookbook`
2. `cd fedora-cookbook`
3. `bundle`
4. `berks`
5. `vagrant plugin install vagrant-berkshelf`
6. `vagrant plugin install vagrant-omnibus`
7. `vagrant up`
8. Enjoy your new fcrepo instance at http://localhost:8080!

# License
MIT License (<http://mit-license.org>)

# Author
Copyright © 2013 MJ Suhonos (<mjsuhonos@ryerson.ca>)
###Acknowledgements
Many thanks to Graham Stewart and others at the University of Toronto Libraries for [LibraryChef](https://github.com/LibraryChef).

Thanks also to Kai Sternad for [Instant Fedora Commons](https://github.com/kaisternad/instant-fedora-commons).
