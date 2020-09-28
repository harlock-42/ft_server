rm /etc/nginx/sites-available/default
rm /usr/share/nginx/html/index.html
cp /tmp/default /etc/nginx/sites-available/
cp /tmp/index.html /usr/share/nginx/html/

# installation

apt update
apt -y install php7.3-fpm
apt install -y php php-mysql php-fpm
apt install -y wget
apt install -y mariadb-server mariadb-client

# mysql setup
mysql -e "SET PASSWORD FOR 'root'@'localhost' = PASWORD('user42');"

#wordpress

cd /tmp
tar -xzvf latest.tar.gz
chown -R www-data:www-data /tmp/wordpress
chmod -R 775 /tmp/wordpress
cp -R /tmp/wordpress /var/www/html/mysite.com
rm -rf latest.tar.gz
cd ..



nginx
