#!/bin/bash
# Check to see if user is Root
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
