```
vagrant plugin install vagrant-hostmanager
vagrant up
vagrant ssh mgt01
sudo -i
./cloudera-manager-installer.bin
```

Point host browser to: localhost:7180 and start install

Notes:
https://www.cloudera.com/documentation/enterprise/latest/topics/cdh_ig_command_line.html

```
rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
sudo rpm --import https://archive.cloudera.com/cdh5/redhat/7/x86_64/cdh/RPM-GPG-KEY-cloudera
curl -O https://archive.cloudera.com/cdh5/redhat/7/x86_64/cdh/cloudera-cdh5.repo /etc/yum.repos.d/
curl -O https://archive.cloudera.com/cm5/installer/latest/cloudera-manager-installer.bin
```
