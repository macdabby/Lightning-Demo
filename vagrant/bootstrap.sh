#!/bin/bash
apt-get update
apt-get install -y nginx php5-fpm mysql-server git php5-mcrypt php5-mysql

echo "mysql-server mysql-server/root_password password password" | sudo debconf-set-selections
mysql -uroot -ppassword -e 'create database lightning; create user lightning@localhost identified by "lightning"; GRANT ALL PRIVILEGES ON lightning.* to lightning@localhost with grant option;'

INSTALL_PHP_DEPENDENCIES=true INSTALL_VENDOR=true INSTALL_SOURCE_DEPENDENCIES=false INSTALL_SOCIAL_SIGNIN_DEPENDENCIES=false INSTALL_DEFAULT_SOURCE=true INSTALL_CK_EDITOR=true INSTALL_CKFINDER=false INSTALL_TINYMCE=false INSTALL_ELFINDER=true INSTALL_INDEX=true INSTALL_HTACCESS=false DBHOST=localhost DBNAME=lightning DBUSER=lightning DBPASS=lightning INSTALL_DATABASE=true INSTALL_DEFAULT_IMAGES=true CREATE_ADMIN=true ADMIN_EMAIL=admin@lightning.local ADMIN_PASSWORD=lightning /var/www/demo/Lightning/install.sh
