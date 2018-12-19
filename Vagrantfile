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
    mgt01.vm.provision "shell", inline: "curl -O https://archive.cloudera.com/cm5/installer/latest/cloudera-manager-installer.bin; chmod +x cloudera-manager-installer.bin"
    mgt01.vm.provision "shell", inline: "echo 'root:cloudera'|chpasswd; sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config; service sshd restart"
    mgt01.vm.hostname = "mgt01"
    mgt01.vm.network :private_network, ip: "10.10.10.100"
    mgt01.vm.network "forwarded_port", guest: 7180, host: 7180
    mgt01.ssh.insert_key = false

    mgt01.vm.provider :virtualbox do |vbox|
      vbox.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      vbox.customize ["modifyvm", :id, "--memory", 8048]
      vbox.customize ["modifyvm", :id, "--name", "mgt01"]
    end
      mgt01.vm.provision "shell", path: "common.sh"
  end

  #== start datanodes loop ==#
  (1..3).each do |i|
    config.vm.define "dn0#{i}" do |datanode|
        # root be changed for ssh pub key
        datanode.vm.provision "shell", inline: "echo 'root:cloudera'|chpasswd; sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config; service sshd restart"
        datanode.vm.network :private_network, ip: "10.10.10.10#{i}"
        datanode.vm.hostname = "dn0#{i}"
        datanode.ssh.insert_key = false

        datanode.vm.provider :virtualbox do |vbox|
            vbox.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
            vbox.customize ["modifyvm", :id, "--memory", 4096]
            vbox.customize ["modifyvm", :id, "--name", "dn0#{i}"]
        end
        # set pwd
      datanode.vm.provision "shell", path: "common.sh"
    end
  end
  #==end host loop ==$
end
