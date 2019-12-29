#!/bin/bash
set -e

#Add the EPEL repository, and update YUM to confirm your change
sudo yum update -y
sudo amazon-linux-extras install epel -y
sudo yum install epel-release

## Install Nginx
sudo amazon-linux-extras install nginx1.12 -y
sudo service nginx start