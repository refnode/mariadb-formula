# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "puppetlabs/centos-7.0-64-puppet"
  config.vm.box_check_update = false
  config.vm.host_name = "mariadb.example.com"

  config.vm.network :forwarded_port, guest: 3306, host: 13306
  
  config.vm.synced_folder "salt", "/srv/"
  
  config.vm.provider :virtualbox do |vb|
    vb.customize [
      "modifyvm", :id,
      "--natdnshostresolver1", "on",
      "--memory", "1024"
    ]
  end
  
  config.vm.provision :shell do |shell|
    shell.inline = "yum -y install epel-release && yum -y install python-pygit2 git"
  end
  
  config.vm.provision :salt do |salt|
    salt.minion_config = "salt/minion"
    salt.install_type = "testing"
    salt.run_highstate = true
    salt.colorize = true
    salt.log_level = "debug"
  end

end
