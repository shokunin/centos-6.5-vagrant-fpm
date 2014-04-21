# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos65"
  config.vm.host_name = "centos65-base"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-65-x64-virtualbox-puppet.box"
  config.vm.synced_folder "./built_package", "/vagrant_data"

# Puppet
  
  config.vm.synced_folder "puppet/modules", "/tmp/vagrant-puppet/puppet/modules"
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.options = ["--modulepath", "/tmp/vagrant-puppet/puppet/modules"]
    puppet.manifest_file  = "site.pp"
  end
end
