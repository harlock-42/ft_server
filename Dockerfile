FROM debian:buster

WORKDIR /tmp

COPY ./srcs/nginx/index.html ./
COPY ./srcs/nginx/default ./
COPY ./srcs/wordpress/latest.tar.gz ./
COPY ./srcs/php/config.inc.php ./
COPY ./srcs/init.sh ./
COPY ./srcs/wordpress/ ./

WORKDIR ..

RUN apt-get update \
&& apt-get install -y vim \
&& apt-get install -y nginx \
&& apt install -y wget \
&& apt install -y php7.3-fpm \
&& apt install -y php7.3-mysql \
&& apt install -y php7.3-common \
&& apt install -y php7.3-gd \
&& apt install -y php7.3-json \
&& apt install -y php7.3-cli \
&& apt install -y php7.3-curl \
&& apt install -y php7.3-xml \
&& apt install -y php7.3-zip \
&& apt install -y php7.3-mbstring \
&& service php7.3-fpm start \
&& apt install -y mariadb-server mariadb-client \
&& apt install -y ufw

RUN chown -R www-data /var/www/* \
&& chmod -R 755 /var/www/* \
&& mkdir -p /var/www/website \
&& touch /var/www/website/index.php \
&& echo "<?php phpinfo(); ?>" >> /var/www/website/index.php


RUN rm /etc/nginx/sites-available/default \
&& rm /etc/nginx/sites-enabled/default \
&& rm /usr/share/nginx/html/index.html \
&& cp /tmp/default /etc/nginx/sites-available/ \
&& cp /tmp/index.html /var/www/website/ \
&& ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/

WORKDIR ./tmp

# SSL

RUN mkdir /etc/nginx/ssl \
&& openssl req -newkey rsa:4096 \
-x509 \
-sha256 \
-days 365 \
-nodes \
-out /etc/nginx/ssl/localhost.pem \
-keyout /etc/nginx/ssl/localhost.key \
-subj "/C=FR/ST=Paris/0=42 School/OU=tallaire/CN=website"

WORKDIR ..

# Mariadb

RUN service mysql start \
&& echo "CREATE USER 'harlock'@'localhost' IDENTIFIED BY 'user42' ;" | mysql -u root \
&& echo "CREATE DATABASE data ; " | mysql -u root \
&& echo "GRANT ALL PRIVILEGES ON *.* TO 'harlock'@'localhost' WITH GRANT OPTION ;" | mysql -u root \
&& echo "UPDATE mysql.user SET Password=PASSWORD ('user42') WHERE User='harlock' ;" | mysql -u root \
&& echo "FLUSH PRIVILEGES ;" | mysql -u root

WORKDIR ./tmp

# Wordpress

RUN mv wordpress /var/www/website/

# PHP

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz \
&& tar xvf phpMyAdmin-5.0.2-all-languages.tar.gz \
&& mv ./config.inc.php ./phpMyAdmin-5.0.2-all-languages/ \
&& mv ./phpMyAdmin-5.0.2-all-languages /var/www/website/phpmyadmin \
&& mkdir -p /var/www/website/phpmyadmin/tmp \
&& chmod -R 775 /var/www/website/phpmyadmin/

WORKDIR ..

ENTRYPOINT bash /tmp/init.sh
