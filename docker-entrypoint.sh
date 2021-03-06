#!/bin/sh

#SSHD
# generate fresh rsa key
ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
# generate fresh dsa key
ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa
#prepare run dir
mkdir -p /var/run/sshd
# prepare config file for key based auth
sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config
sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config
sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config
sed -i "s/#AuthorizedKeysFile/AuthorizedKeysFile/g" /etc/ssh/sshd_config

# DOCKER
# configure profile for all users
echo "export DOCKER_HOST='tcp://$DOCKER_IP:$DOCKER_PORT'" >> /etc/profile
source /etc/profile

exec "$@"
