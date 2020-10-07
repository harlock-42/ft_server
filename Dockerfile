FROM debian:buster

WORKDIR /tmp

COPY ./srcs/nginx/index.html ./
COPY ./srcs/nginx/default ./
COPY ./srcs/wordpress/latest.tar.gz ./
COPY ./srcs/init.sh ./

WORKDIR ..

RUN apt-get update \
&& apt-get install -y vim \
&& apt-get install -y nginx \
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

RUN rm /etc/nginx/sites-available/default \
&& rm /usr/share/nginx/html/index.html \
&& cp /tmp/default /etc/nginx/sites-available/ \
&& cp /tmp/index.html /usr/share/nginx/html/

WORKDIR ./tmp

RUN mkdir /var/log/nginx/website \
&& chown -R www-data /var/log/nginx/website/

# SSL

RUN mkdir /etc/nginx/ssl \
&& openssl req -newkey rsa:4096 \
-x509 \
-sha256 \
-days 365 \
-nodes \
-out /etc/nginx/ssl/localhost.pem \
-keyout /etc/nginx/ssl/localhost.key \
-subj "/C=FR/ST=Paris/0=42 School/OU=tallaire/CN=mysite.com"

WORKDIR ..

# Mariadb

RUN service mysql start \
#&& echo "CREATE USER" 'harlock'@'localhost' IDENTIFIED BY 'user42' ; | mysql -u root \
&& echo "CREATE DATABASE harlock ; " | mysql -u root

