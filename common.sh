#!/bin/bash
# Install prerequisites
sudo yum -y clean 
sudo yum -y update
sudo yum -y install net-tools ntp wget lsof unzip tar dos2unix
#iptables-services
# Enable NTP
sudo systemctl enable ntpd && sudo systemctl start ntpd
# Disable Firewall
sudo systemctl disable firewalld && sudo systemctl stop firewalld
sudo iptables --flush INPUT && sudo iptables --flush FORWARD && sudo service iptables save
# Disable SELINUX
sudo sed -i --follow-symlinks 's/^SELINUX=.*/SELINUX=disabled/g' /etc/sysconfig/selinux
