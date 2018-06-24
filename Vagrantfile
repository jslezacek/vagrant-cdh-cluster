Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.provider "virtualbox"
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.manage_guest = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true

#== host mgt01 ==$
  config.vm.define "mgt01" do |mgt01|
    mgt01.vm.network :private_network, ip: "10.10.10.100"
    mgt01.vm.network "forwarded_port", guest: 7180, host: 7180

    mgt01.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 8048]
      v.customize ["modifyvm", :id, "--name", "mgt01"]
    end
  end
#==end host mgt01 ==$

#== host dn01  ==$
  config.vm.define "dn01" do |dn01|
    dn01.vm.network :private_network, ip: "10.10.10.101"

    dn01.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 2048]
      v.customize ["modifyvm", :id, "--name", "dn01"]
    end
  end
#==end host dn01 ==$

end
