#!/bin/bash
# Checking to see if user is Root
if ! [ $(id -u) = 0 ]; then
   echo "The script need to be run as root." >&2
   exit 1
fi
if [ $SUDO_USER ]; then
    real_user=$SUDO_USER
else
    real_user=$(whoami)
fi
# Pulling FileBeat from server
curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.9.2-amd64.deb
# Downloading FileBeat
sudo dpkg -i filebeat-7.9.2-amd64.deb
# Downloading FileBeat
curl -L -O https://gist.githubusercontent.com/slape/5cc350109583af6cbe577bbcc0710c93/raw/eca603b72586fbe148c11f9c87bf96a63cb25760/Filebeat
# Moving FileBeat
mv Filebeat /etc/filebeat/filebeat.yml
# Opening FileBeat config file with nano
nano /etc/filebeat/filebeat.yml
