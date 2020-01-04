#!/bin/bash
set -e

#Add the EPEL repository, and update YUM to confirm your change
sudo yum update -y
sudo amazon-linux-extras install epel -y

## install git
sudo yum install git -y


## install docker
sudo yum install docker -y
sudo usermod -a -G docker jenkins
sudo chkconfig docker on

## install docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

