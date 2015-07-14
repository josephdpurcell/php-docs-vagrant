Vagrant.configure("2") do |config|
  # Variables
  ip          = "192.168.7.8"
  project     = "docs.php"
  docs_root = "/usr/local/share/php-docs"
  provisioning_root = "/vagrant/provisioning"

  # Base Box
  config.vm.box     = "ubuntu/trusty64"

  # Networking
  config.vm.network "private_network", ip: ip
  config.ssh.forward_agent = true
  config.vm.hostname = "#{project}.local"

  # NFS Mount
  config.vm.synced_folder ".", "/vagrant", type: "nfs"
  config.vm.synced_folder "php-docs", docs_root, type: "nfs"

  # Provisioning
  config.vm.provision :shell, path: "provisioning/bootstrap.sh", args: [provisioning_root, docs_root]
end
