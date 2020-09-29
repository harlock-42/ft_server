rm /etc/nginx/sites-available/default
rm /usr/share/nginx/html/index.html
cp /tmp/default /etc/nginx/sites-available/
cp /tmp/index.html /usr/share/nginx/html/
cp /tmp/www.website.com.conf /etc/nginx/sites-available/
cp /tmp/www.website.com.conf /etc/nginx/sites-enabled/

# installation

apt update
apt install -y wget

# installation php

apt -y install  php7.3-fpm \
&& apt -y install php7.3-mysql \
&& apt -y install php7.3-common \
&& apt -y install php7.3-gd \
&& apt -y install php7.3-json \
&& apt -y install php7.3-cli \
&& apt -y install php7.3-curl \
&& apt -y install php7.3-xml \
&& apt -y install php7.3-zip \
&& apt -y install php7.3-mbstring \

# start php

service php7.3-fpm start

# installation mariadb

apt install -y mariadb-server mariadb-client

# mysql setup

mysql -e "SET PASSWORD FOR 'root'@'localhost' = PASWORD('user42');"

# start mariadb

service mysql start

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




nginx
