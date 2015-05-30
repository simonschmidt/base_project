# -*- mode: ruby -*-
# vi: set ft=ruby :

project_name = File.basename(Dir.getwd).gsub(/([^0-9a-zA-Z\-])/, '-')

BOX_NAME= "Fedora-Cloud-Base-Virtualbox-22"
BOX_URL = "https://download.fedoraproject.org/pub/fedora/linux/releases/22/Cloud/x86_64/Images/Fedora-Cloud-Base-Vagrant-22-20150521.x86_64.vagrant-virtualbox.box"
BOX_AMI = "ami-d17e08a6"
BOX_AMI_USERNAME = "fedora"

Vagrant.configure(2) do |config|
  config.vm.box = BOX_NAME
  config.vm.box_url = BOX_URL
  config.vm.hostname = project_name + "-vagrant"


  config.vm.provision :salt do |salt|
    salt.minion_config = "saltstack/etc/minion"
    salt.run_highstate = true
    salt.verbose = true
  end


  config.vm.provider "virtualbox" do |vb|
    # ...
  end


  # Amazon provider, https://github.com/mitchellh/vagrant-aws
  config.vm.provider :aws do |aws, override|
    aws.tags = {
      "Name" => project_name
    }
    aws.ami = BOX_AMI
    override.ssh.username = BOX_AMI_USERNAME
    aws.instance_type = "t2.micro"
    aws.region = "eu-west-1"

    aws.access_key_id = ENV['AWS_KEY']
    aws.secret_access_key = ENV['AWS_SECRET']
    aws.keypair_name = ENV['AWS_KEYNAME']
    aws.security_groups = ENV['AWS_SECURITY_GROUP']
    override.ssh.private_key_path = ENV['AWS_KEYPATH']

    override.vm.box = "dummy"
    override.vm.box_url = "https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box"

    override.vm.synced_folder ".", "/vagrant",
      type: "rsync",
      rsync__exclude: [".vagrant", ".git", "venv"]
  end

  config.vm.post_up_message = "Machine is up!"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"
end
