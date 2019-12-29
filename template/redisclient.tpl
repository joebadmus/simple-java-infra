#!/bin/bash
set -e

#Add the EPEL repository, and update YUM to confirm your change
sudo yum update -y
sudo amazon-linux-extras install epel -y


## set up redis client
sudo yum install redis -y
sudo systemctl start redis 

## connect redis client 
## redis-cli -h {****************}