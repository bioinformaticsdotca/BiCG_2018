#!/bin/bash
set -e

# Install Java 8
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get -y install oracle-java8-installer

# Get the dockstore tool
mkdir -p ~/bin
cd ~/bin
sudo apt-get -y install wget
wget https://github.com/ga4gh/dockstore/releases/download/1.3.6/dockstore
chmod u+x dockstore

# Add the location of the dockstore script to $PATH if not already (~ubuntu/bin already is)

# Now, set up the dockstore configuration file:
cd ~
mkdir -p ~/.dockstore
touch ~/.dockstore/config

# Add to ~/.dockstore/config these lines:
echo "server-url: https://dockstore.org:8443" >> ~/.dockstore/config
# A token, You only need a valid token if you want to push data TO dockstore. To pull data, "DUMMY" is fine.
echo "token: DUMMY" >> ~/.dockstore/config
# Caching, Turn on caching to prevent the same input files from being downloaded again and again and again...
echo "use-cache=true" >> ~/.dockstore/config

# Install docker
sudo apt-get -y install curl
curl -sSL https://get.docker.com/ | sh

# This will take a few minutes. Detailed installation information can be found [here] (https://docs.docker.com/v1.8/installation/ubuntulinux/)

# Get cwltool
sudo apt-get -y install python-pip
pip install setuptools==36.5.0
pip install cwl-runner cwltool==1.0.20170828135420 schema-salad==2.6.20170806163416 avro==1.8.1 ruamel.yaml==0.14.12 requests==2.18.4

# *Note:* If you are on **ubuntu 14**, you may also need `sudo pip install typing` and pip install commands will need to be run as `sudo`:

# Add your user to the docker user group
# This is so you can run `docker` without having to sudo every time.
# After you execute the line below, you will need to **log out and log back in**.
sudo usermod -aG docker $USER
# Now logout of exec newgrp docker
