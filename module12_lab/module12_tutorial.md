---
layout: tutorial_page
permalink: /BiCG_2018_module12
title: BiCG Lab 12
header1: Workshop Pages for Students
header2: Bioinformatics for Cancer Genomics
image: /site_images/CBW_cancerDNA_icon-16.jpg
home: https://bioinformaticsdotca.github.io/bicg_2018
description:  BiCG Lab 12
author: Solomon Shorser
modified: October 25th, 2018
---

# Bioinformatics for Cancer Genomics 12 Lab

This lab was created by Solomon Shorser

## Introduction

### Description of the lab


Welcome to the lab for Big Data Analysis! This lab will consolidate what you have learned about Cloud Computing by aligning reads from a cell line as an example.

After this lab, you will be able to:

* Install the dockstore CLI.
* Run CWL tools and workflows using the dockstore CLI.

Things to know before you start:

The lab may take between 1-2 hours, depending on your familiarity with Cloud Computing and alignment tasks.

### Requirments

Set up a fresh VM by following the instructions in [Module 10 lab] (https://github.com/bioinformaticsdotca/BiCG_2018/blob/master/module10/lab.md), but with the following changes:

* choose flavor c1.large
* don't assign a floating IP

Without a floating IP, this VM is only accessible from Collaboratory.  Note that there are often not enough floating IPs for all VMs when you're running a fleet.  So you'll have to set up a "jump server" as a getway to ssh from outside into Collaboratory.  Then from the jump server, you can ssh into any of the VMs in your fleet.  We'll use the VM (c1.micro) you've set up for Modules 3 and 4 as a jump server.  If you haven't already done so, add your prviate key to the jump server.  From the console, find the IP address of the new c1.large VM and ssh into it.

```
ssh -i path_to_private_key ubuntu@10.0.0.XXX
```

## Setting up your VM


### Install Java

```
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update && sudo apt-get install -y oracle-java8-set-default
```

### Get the dockstore tool
Latest instructions for installing Dockstore at https://dockstore.org/quick-start

```
mkdir -p ~/bin
curl -L -o ~/bin/dockstore https://github.com/ga4gh/dockstore/releases/download/1.5.1/dockstore
chmod +x ~/bin/dockstore
echo 'export PATH=~/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
```

### Add the location of the dockstore script to $PATH.

Using your favourite text editor (try pico if you don't have one), add this line to the end of ~/.bashrc:

```
PATH=$PATH:~/sbin
```

Now, set up the dockstore configuration file:

```
cd ~
mkdir -p ~/.dockstore
touch ~/.dockstore/config
```

#### Add to ~/.dockstore/config these lines:

##### The URL for dockstore

```
server-url: https://dockstore.org:8443
```

##### A token

You only need a valid token if you want to push data TO dockstore. To pull data, "DUMMY" is fine.

```
token: DUMMY
```

##### Caching

Turn on caching to prevent the same input files from being downloaded again and again and again...

```
use-cache=true
```

### Install docker
The full instructions are on Docker's website: https://docs.docker.com/install/linux/docker-ce/ubuntu/

##### Fast Method

```
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```

##### Manual Method
If the Fast Method does not work, you can try the manual process described below.

First, install prerequisite software:
```
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
```

Add Docker’s official GPG key:
```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

Add the Docker repository (for x86_64/amd64 architecture):
```
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```
Set `arch` in the command above to `armhf` for armhf platforms, `ppc64el` for IBM PPC, or `s390x` for IBM Z s390x.

Now that you've added a new repository, run `apt update`:
```
sudo apt-get update
```

Install docker:
```
sudo apt-get install docker-ce
```

#### Testing Docker

You can test your docker installation by running:
```
sudo docker run hello-world
```
This command will tell you if docker was successfully installed.

#### Add your user to the docker user group

This is so you can run `docker` without having to sudo every time.   

```
sudo usermod -aG docker $USER
```
After you execute the above below, you will need to ***log out and log back in***.   


### Get cwltool
Install Python's package manager pip (if it is not already installed) and then download the appropriate requirements file and have pip install cwltool. If you are using Python 2:

```
sudo apt install python-pip
curl -o requirements.txt "https://dockstore.org:443/api/metadata/runner_dependencies?client_version=1.5.1&python_version=2"
pip install -r requirements.txt
```

If you are using Python 3:

```
sudo apt install python-pip
curl -o requirements.txt curl -o requirements.txt "https://dockstore.org:443/api/metadata/runner_dependencies?client_version=1.5.1&python_version=3"
pip install -r requirements.txt
```

*Note:* You may need to run the pip install commands as `sudo`:


### Use the dockstore CLI to fetch the CWL

The dockstore CLI will download the CWL file for the tool specified by `--entry`.

```
dockstore tool cwl --entry quay.io/pancancer/pcawg-bwa-mem-workflow:2.6.8-cwl1 > Dockstore.cwl
```

*Note:* If you get an error "dockstore: command not found", that's because you haven't logged out and logged back in after adding yourself to the docker group.


### Prepare your JSON input file


#### Generate the JSON file

JSON files can be automatically generated from the CWL file. You will have to fill in the default values in this file.

```
dockstore tool convert cwl2json --cwl Dockstore.cwl > Dockstore.json
```

#### Download an existing file

An existing input JSON file can be found here.  Edit it if you wish, but note that '~' if used in the JSON is not interpreted as home directory.

```
wget https://raw.githubusercontent.com/bioinformaticsdotca/BiCG_2018/master/module12_lab/sample_input.json
```

### Create a directory for the output data.  We use '~/tmp' in the example JSON.

```
mkdir ~/tmp
```

You are ready to run BWA-Mem using the Dockstore CLI (see below).  However, if you have time, try downloading the input data (unaligned BAM) to your VM using the icgc-storage-client.  In Module 10, you ran icgc-storage-client as a Docker.  We'll now run it as a command line tool.  

### Download unaligned BAMs using the icgc-storage-client

To install the tool,

```
wget -O icgc-storage-client.tar.gz https://dcc.icgc.org/api/v1/ui/software/icgc-storage-client/latest
tar -zxvf icgc-storage-client.tar.gz
```

Here are the 2 unaligned BAMs with their object ids.  They are are open-access in Collaboratory and don't require a token.

```
hg19.chr22.5x.normal.bam	26ed125c-bc28-552c-b82d-1de2561b3911
hg19.chr22.5x.normal2.bam	1039a928-a767-5fe4-a50a-4e7af8ced828
```

Method 1: Genereate a pre-signed URL, and download using curl or wget.  Remember to put quotes for the URL in the wget command.  Otherwise, you'll get a 403 error.

```
mkdir input
icgc-storage-client-1.0.23/bin/icgc-storage-client --profile collab url --object-id 1039a928-a767-5fe4-a50a-4e7af8ced828
wget -O input/hg19.chr22.5x.normal2.bam "<pre-signed URL>"
```

Method 2: Download using the icgc-storage client which will handle multi-part download and resume after interruption.

```
icgc-storage-client-1.0.23/bin/icgc-storage-client --profile collab download --object-id 26ed125c-bc28-552c-b82d-1de2561b3911 --output-layout bundle --output-dir input
```

Organize the files in your input directory. Then edit the JSON sample_input.json to update under "reads" the paths to 2 unaligned BAMs.


### Run it locally with the Dockstore CLI

```
dockstore tool launch --entry quay.io/pancancer/pcawg-bwa-mem-workflow:2.6.8_1.2 --json sample_input.json
```
