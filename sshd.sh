#!/bin/sh

# generate fresh rsa key
ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa

#prepare run dir
mkdir -p /var/run/sshd

# prepare config file for key based auth
sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config
sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config
sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config
sed -i "s/#AuthorizedKeysFile/AuthorizedKeysFile/g" /etc/ssh/sshd_config

# start ssh daemon
/usr/sbin/sshd -D
