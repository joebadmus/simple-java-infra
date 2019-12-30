#!/bin/bash
set -e

#Add the EPEL repository, and update YUM to confirm your change
sudo yum update -y
sudo amazon-linux-extras install epel -y

## installl java
sudo yum install java-1.8.0-openjdk-demo.x86_64 -y

## set up redis client
## install git
sudo yum install git -y


## install maven
sudo yum install maven -y


# install jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
sudo rpm --import http://pkg.jenkins-ci.org/redhat-stable/jenkins-ci.org.key -y
sudo  yum install jenkins -y
sudo service jenkins start

## install docker
sudo yum install docker -y
sudo usermod -a -G docker jenkins
sudo chkconfig docker on

## install docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

## install terraform
sudo curl -O https://releases.hashicorp.com/terraform/0.12.18/terraform_0.12.18_freebsd_amd64.zip
sudo unzip terraform_0.12.18_freebsd_amd64.zip -d /usr/bin/