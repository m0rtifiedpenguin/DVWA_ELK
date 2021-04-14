#!/bin/bash
# Check to see if user is Root
if ! [ $(id -u) = 0 ]; then
	echo "The script need to be run as root." >&2
	exit 1
fi
if [ $SUDO_USER ]; then
	real_user=$SUDO_USER
else
	real_user=$(whoami)
fi
# Updating
apt-get update
# Upgrading
apt-get upgrade
# Install docker to box 
apt install docker.io &&
# Install python
apt install python3-pip &&
# Installs docker python module
apt install docker &&
# Increase virtual memory
sysctl -w vm.max_map_count=262144 &&
# Start docker
systemctl start docker &&
systemctl enable docker.service &&
systemctl enable containerd.service &&
# Pull docker elk
docker pull sebp/elk &&
# Create Image
docker run -it -p 5601:5601 -p 9200:9200 -p 5044:5044 --restart always sebp/elk
