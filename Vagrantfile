# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "fedora-commons-berkshelf"

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Forward port mappings
  config.vm.network :forwarded_port, guest: 8080, host: 8080 # Tomcat
  config.vm.network :forwarded_port, guest: 3306, host: 3306 # MySQL
  config.vm.network :forwarded_port, guest: 5432, host: 5432 # PostgreSQL

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", '1024']
    vb.customize ["modifyvm", :id, "--cpus", "2"]
  end

  # Enabling the Berkshelf plugin.
  config.berkshelf.enabled = true

  # Ensure we are using the latest version of Chef on the VM
  config.omnibus.chef_version = :latest

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      # FIXME: this has to be here due to an override problem; see:
      # http://serverfault.com/questions/541155/
      "java" => {
        "jdk_version" => "7"
      },
      # FIXME: this should be found by the java recipe, but isn't.
      # Location is probably platform-specific
      "tomcat" => {
        "keytool" => "/usr/bin/keytool"
      }
    }

    chef.add_recipe("ubuntu-baseline")
    chef.add_recipe("fedora-commons")
  end
end
