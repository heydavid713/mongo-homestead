#!/bin/bash

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo apt-get install php-pear -y
sudo apt-get install libcurl3-openssl-dev -y
yes '' | sudo pecl install pecl_http
yes '' | sudo pecl install mongodb
echo "extension=mongodb.so" | sudo tee -a /etc/php/7.0/cli/php.ini
echo "extension=mongodb.so" | sudo tee -a /etc/php/7.0/fpm/php.ini
sudo service nginx restart
