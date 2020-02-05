#!/bin/bash -eux
# Based off the great "Preparing Linux Template VMs"

echo "==> Cleaning up yum cache"
/bin/rm -rf /var/cache/yum

echo "==> Force logs to rotate"
/usr/sbin/logrotate -f /etc/logrotate.conf
/bin/rm -f /var/log/*-???????? /var/log/*.gz
/bin/rm -f /var/log/dmesg.old
/bin/rm -rf /var/log/anaconda

echo "==> Clear audit log and wtmp"
/bin/cat /dev/null > /var/log/audit/audit.log
/bin/cat /dev/null > /var/log/wtmp
/bin/cat /dev/null > /var/log/lastlog
/bin/cat /dev/null > /var/log/grubby

echo "==> Cleaning up udev rules"
/bin/rm -f /etc/udev/rules.d/70*

echo "==> Remove the traces of the template MAC address and UUIDs"

sed -i'' -e '/UUID=/d' /etc/sysconfig/network-scripts/ifcfg-e*
sed -i'' -e '/HWADDR=/d' /etc/sysconfig/network-scripts/ifcfg-e*
sed -i'' -e '/DHCP_HOSTNAME=/d' /etc/sysconfig/network-scripts/ifcfg-e*
sed -i'' -e 's/NM_CONTROLLED=.*/NM_CONTROLLED="no"/' /etc/sysconfig/network-scripts/ifcfg-e*

echo "==> Cleaning up tmp"
/bin/rm -rf /tmp/*
/bin/rm -rf /var/tmp/*

echo "==> Remove the SSH host keys"
/bin/rm -f /etc/ssh/*key*

echo "==> Remove the root user’s SSH files"
/bin/rm -rf ~root/.ssh/

echo "==> Remove the machine-id"
/bin/chmod 777 /etc/machine-id; echo -n "" > /etc/machine-id; /bin/chmod 444 /etc/machine-id

echo "==> Remove Proxy"
/bin/rm -f /etc/profile.d/http_proxy.sh
unset {http,ftp,https,no}_proxy

echo "==> Cleaning up yum cache"
/bin/rm -rf /var/cache/yum

echo "==> Remove the root user’s shell history"
/bin/rm -f ~root/.bash_history

history -c