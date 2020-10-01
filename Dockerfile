FROM debian:buster

RUN apt-get update \
&& apt-get install -y vim \
&& apt-get install -y nginx \
&& apt instatll -y php7.3-fpm \
&& apt instatll -y php7.3-mysql \
&& apt instatll -y php7.3-common \
&& apt instatll -y php7.3-gd \
&& apt instatll -y php7.3-json \
&& apt instatll -y php7.3-cli \
&& apt instatll -y php7.3-curl \
&& apt instatll -y php7.3-xml \
&& apt instatll -y php7.3-zip \
&& apt instatll -y php7.3-mbstring \
&& service php7.3-fpm start \
&& apt install -y mariadb-server mariadb-client \
&& mysql -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('user42');" \
&& service mysql start

WORKDIR /tmp

COPY ./srcs/nginx/index.html ./
COPY ./srcs/nginx/default ./
COPY ./srcs/wordpress/latest.tar.gz ./
COPY ./srcs/init.sh ./

RUN ./init.sh

WORKDIR ..

CMD ["bash"]
