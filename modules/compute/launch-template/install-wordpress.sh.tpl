#!/bin/bash
sudo yum update -y
sudo yum install -y httpd mariadb105-server php php-mysqlnd php-fpm php-xml wget amazon-efs-utils

# Mount the EFS file system
sudo mkdir -p /var/www/html
sudo mount -t efs -o tls ${efs_dns_name}:/ /var/www/html

# Start Apache and MariaDB services
sudo service httpd start
sudo service mariadb start

# If WordPress is not already installed, download and install it
if [ ! -d "/var/www/html/wordpress/" ]; then
  sudo mkdir -p /var/www/html/wordpress/
  cd /var/www/html/
  sudo rm -rf /var/www/html/* 
  sudo rm -rf /var/www/html/.[!.]*
  sudo wget https://wordpress.org/latest.tar.gz
  sudo tar -xvzf latest.tar.gz
  sudo mkdir /tmp/wordpress_move
  sudo mv /var/www/html/wordpress/* /tmp/wordpress_move/
  sudo mv /tmp/wordpress_move/* /var/www/html/
  sudo rmdir /tmp/wordpress_move
  sudo mkdir -p /var/www/html/wordpress/
  sudo rm -f latest.tar.gz

  sudo cp wp-config-sample.php wp-config.php
  sudo sed -i "s/database_name_here/${db_name}/" wp-config.php
  sudo sed -i "s/username_here/${db_user}/" wp-config.php
  sudo sed -i "s/password_here/${db_password}/" wp-config.php
  sudo sed -i "s/localhost/${rds_endpoint}/" wp-config.php

  sudo chown -R apache:apache /var/www/html/

  sudo curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  sudo chmod +x wp-cli.phar
  sudo mv wp-cli.phar /usr/local/bin/wp
  sudo wp core install --url="http://${load_balancer_dns_name}" --title="Andreas' AWS Training WordPress Site" --admin_user="admin" --admin_password="admin_password" --admin_email="admin@example.com" --path=/var/www/html/ --allow-root
fi

sudo service httpd restart
