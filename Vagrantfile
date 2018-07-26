# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = 'centos/7'

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  config.ssh.forward_agent = true

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.

  # neo4j dev
  config.vm.network 'forwarded_port', guest: 7474, host: 7474

  # default rails port
  config.vm.network 'forwarded_port', guest: 3000, host: 3000

  # default elasticsearch port
  config.vm.network 'forwarded_port', guest: 9200, host: 9200

  # forward nginx ssl for application
  config.vm.network 'forwarded_port', guest: 443, host: 4443

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10", auto_config: false

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  #
  # Explicitly state shared folder type for virtualbox as my machine was default
  # to rsync and was not working correctly.
  config.vm.synced_folder '.', '/vagrant', type: 'virtualbox'

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider 'virtualbox' do |v|
    v.memory = 4096
    v.cpus = 2
  end

  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision :ansible do |ansible|
    # vagrant's guiding principle is simplicity. one command `vagrant up` and
    # have everything done. Therefore, there is currently no way to get user
    # input. This is important for git user name and email. On a new box git
    # is blank and a common scenario for the developer to forget that it's blank
    # and make a few commits as "invalid email address". The solution is to have
    # the vagrant box grab the git credentials from the host machine and use
    # those.
    name = `git config --global user.name`.chomp
    email = `git config --global user.email`.chomp
    ansible.playbook = 'playbook.yml'
    ansible.extra_vars = { git_user_name: name, git_email: email }
    ansible.ask_vault_pass = true
  end
end
