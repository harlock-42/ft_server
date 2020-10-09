
# installation


# start php


# installation mariadb


#wordpress

#cd /tmp
#tar -xzvf latest.tar.gz
#chown -R www-data:www-data /tmp/wordpress
#chmod -R 775 /tmp/wordpress
#cp -R /tmp/wordpress /var/www/html/mysite.com
#rm -rf latest.tar.gz
#cd ..

#echo "<?php phpinfo(); ?>" >> /var/www/html/mysite.com/index.php

service nginx start
service mysql start
service php7.3-fpm start

while pgrep nginx > /dev/null
do sleep 1;
done
#echo "CREATE DATABASE harlock ;" | mysql -u root
#echo "GRANT ALL PRIVILEGES ON harlock.* TO 'root'@'localhost' WITH GRANT OPTION ;" | mysql -u root
#echo "UPDATE mysql.user SET  Password=PASSWORD ('user42') WHERE User=root ;" | mysql -u root

#echo "OK"

#echo "CREATE DATABASE harl ;" | mysql -u root

#ls -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

# SSL

#service nginx start
