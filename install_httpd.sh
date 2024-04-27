#!/bin/bash	
sudo yum update -y
sudo yum install httpd -y
sudo yum install git -y
git clone https://github.com/maheshde791/app_deploy_ec2.git
mv ./app_deploy_ec2/index.html /var/www/html
sudo systemctl start httpd
sudo systemctl enable httpd
