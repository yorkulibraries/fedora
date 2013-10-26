name             'fedora-commons'
maintainer       'MJ Suhonos'
maintainer_email 'mjsuhonos@ryerson.ca'
license          'MIT License <http://mit-license.org>'
description      'Installs/Configures Fedora Commons'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '3.7.0'

depends          'java'
depends          'tomcat'

depends          'database'
depends          'mysql'
depends          'postgresql'