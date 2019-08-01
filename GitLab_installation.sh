#!/bin/bash

# update the system
sudo apt-get update

#install certificate and postfix
sudo apt-get install ca-certificates curl openssh-server postfix

# Go to tmp directory and download installation script
cd /tmp
curl -LO https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh

# Run the installation script
sudo bash /tmp/script.deb.sh

# Install GItlab
sudo apt-get install gitlab-ce

# firwall status
sudo ufw status # do not do anything if it is inactive

# Edit the config file
# If your GitLab server does not have a domain name, you will need to use an IP
# address instead of a domain and keep the protocol as `http`.

sudo nano /etc/gitlab/gitlab.rb # external_url 'http://your_server_IP'

# Reconfigure the git
sudo gitlab-ctl reconfigure


# It may take some time to reconfigure (5 min or more), sometimes it get stuck as well.
# Have patience and keep trying
# once reconfiguration complete go to browser for initial setup
# open 'http://your_server_IP' in a browser and set the password on the welcome page
# login with username = 'root', password= 'set by you'
