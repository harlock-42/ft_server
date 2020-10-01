rm /etc/nginx/sites-available/default
rm /usr/share/nginx/html/index.html
cp /tmp/default /etc/nginx/sites-available/
cp /tmp/index.html /usr/share/nginx/html/

# installation


# start php


# installation mariadb


# mysql setup


# start mariadb


#wordpress

cd /tmp
tar -xzvf latest.tar.gz
chown -R www-data:www-data /tmp/wordpress
chmod -R 775 /tmp/wordpress
cp -R /tmp/wordpress /var/www/html/mysite.com
rm -rf latest.tar.gz
cd ..

echo "<?php phpinfo(); ?>" >> /var/www/html/mysite.com/index.php

mkdir /var/log/nginx/website
chown -R www-data /var/log/nginx/website/

ls -s /etc/nginx/sites-available/www.website.com.conf /etc/nginx/sites-enabled/www.website.com.conf

# SSL

mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/mysite.com.pem -keyout /etc/nginx/ssl/monsupersite.key -subj "/C=FR/ST=Paris/0=42 School/OU=tallaire/CN=mysite.com"

#service nginx start
