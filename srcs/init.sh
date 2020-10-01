
# installation


# start php


# installation mariadb


# mysql setup

mysql -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('user42');"

# start mariadb

service mysql start

#wordpress

#cd /tmp
#tar -xzvf latest.tar.gz
#chown -R www-data:www-data /tmp/wordpress
#chmod -R 775 /tmp/wordpress
#cp -R /tmp/wordpress /var/www/html/mysite.com
#rm -rf latest.tar.gz
#cd ..

echo "<?php phpinfo(); ?>" >> /var/www/html/mysite.com/index.php

mkdir /var/log/nginx/website
chown -R www-data /var/log/nginx/website/

#ls -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

# SSL

#service nginx start
