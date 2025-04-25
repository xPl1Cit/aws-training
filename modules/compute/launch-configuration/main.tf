resource "aws_launch_configuration" "wordpress" {
  name          = "${var.project}-wordpress-lc-${var.stage}"
  image_id      = var.ami
  instance_type = var.instance_type
  security_groups = [ var.security_group_id ]
  key_name = var.key_name
  
  lifecycle {
    create_before_destroy = true
  }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd mariadb-server php php-mysqlnd php-fpm php-xml wget nfs-utils

              # Mount the EFS file system
              mkdir -p /var/www/html
              mount -t nfs4 -o nfsvers=4.1 ${var.efs_dns_name}:/ /var/www/html

              # Start Apache and MariaDB services
              service httpd start
              service mariadb start

              # If WordPress is not already installed, download and install it
              if [ ! -d "/var/www/html/wordpress" ]; then
                cd /var/www/html
                wget https://wordpress.org/latest.tar.gz
                tar -xvzf latest.tar.gz
                rm -f latest.tar.gz

                # Configure wp-config.php to connect to RDS
                cp wordpress/wp-config-sample.php wordpress/wp-config.php
                sed -i "s/database_name_here/${var.db_name}/" /var/www/html/wordpress/wp-config.php
                sed -i "s/username_here/${var.db_user}/" /var/www/html/wordpress/wp-config.php
                sed -i "s/password_here/${var.db_password}/" /var/www/html/wordpress/wp-config.php
                sed -i "s/localhost/${var.rds_endpoint}:${var.rds_port}/" /var/www/html/wordpress/wp-config.php

                # Set permissions for the WordPress files
                chown -R apache:apache /var/www/html/wordpress

                # Run WordPress core install
                wp core install --url="http://${var.load_balancer_dns_name}" --title="WordPress Site" --admin_user="admin" --admin_password="admin_password" --admin_email="admin@example.com"
              fi

              # Restart Apache
              service httpd restart
              EOF
}
