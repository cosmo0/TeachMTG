# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "vm_map5"

  # config.vm.network :forwarded_port, guest: 80, host: 8080
  
  config.vm.provider :virtualbox do |vb|
	vb.name = "teachmtg"
  #   vb.gui = true
    vb.customize ["modifyvm", :id, "--memory", "1024"]
    vb.customize ["modifyvm", :id, "--cpus", "1"]
  end

end
