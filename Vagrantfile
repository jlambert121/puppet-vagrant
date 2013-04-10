# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "centos"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  # config.vm.box_url = "http://domain.com/path/to/above.box"

  # Boot with a GUI so you can see the screen. (Default is headless)
  # config.vm.boot_mode = :gui

  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.
  # config.vm.network :hostonly, "192.168.33.10"

  # Assign this VM to a bridged network, allowing you to connect directly to a
  # network using the host's network device. This makes the VM appear as another
  # physical device on your network.
  # config.vm.network :bridged

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  # config.vm.forward_port 80, 8080

  # Share an additional folder to the guest VM. The first argument is
  # an identifier, the second is the path on the guest to mount the
  # folder, and the third is the path on the host to the actual folder.
  # config.vm.share_folder "v-data", "/vagrant_data", "../data"

  # Enable provisioning with Puppet stand alone.  Puppet manifests
  # are contained in a directory path relative to this Vagrantfile.
  # You will need to create the manifests directory and a manifest in
  # the file base.pp in the manifests_path directory.
  #
  # An example Puppet manifest to provision the message of the day:
  #
  # # group { "puppet":
  # #   ensure => "present",
  # # }
  # #
  # # File { owner => 0, group => 0, mode => 0644 }
  # #
  # # file { '/etc/motd':
  # #   content => "Welcome to your Vagrant-built virtual machine!
  # #               Managed by Puppet.\n"
  # # }
  #
 config.vm.define :master do |master_config|
   master_config.vm.host_name = "puppet.local"
   master_config.vm.network :hostonly, "10.100.1.10"
   master_config.vm.share_folder("puppet-modules", "/etc/puppet/modules", "/Users/mbarr/puppet/modules/")
   master_config.vm.share_folder("puppet-manifests", "/etc/puppet/manifests", "/Users/mbarr/puppet/manifests/")
   master_config.vm.share_folder("repos", "/var/www/html", "repos")
   master_config.vm.share_folder("centos", "/var/www/html/centos", "/Volumes/CentOS_6.3_Final/")
    
   master_config.vm.provision :puppet do |p|
      p.manifests_path = "manifests"
      p.manifest_file  = "init.pp"
    end
 end
   
 config.vm.define :client do |client_config|
   client_config.vm.host_name = "client.local"
   client_config.vm.network  :hostonly, "10.100.1.11"
   config.vm.provision :shell, :inline => "cp /vagrant/files/hosts.client /etc/hosts"
  end


# config.vm.define :slave do |slave_config|
#   slave_config.vm.host_name = "slave.local"
#   slave_config.vm.network  :hostonly, "10.100.1.12"
#   config.vm.provision :shell, :inline => "cp /vagrant/files/hosts.client /etc/hosts"
#   #client_config.vm.provision :puppet_server
#  end
end
