#!/bin/bash
set -e

#Add the EPEL repository, and update YUM to confirm your change
sudo yum update -y
sudo amazon-linux-extras install epel -y


## set up redis client
## install git
sudo yum install git -y


## install maven
sudo yum install maven -y

## install docker
sudo yum install docker -y
sudo usermod -a -G docker jenkins
sudo chkconfig docker on