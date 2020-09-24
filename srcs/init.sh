rm /etc/nginx/sites-available/default
rm /usr/share/nginx/html/index.html
cp /tmp/default /etc/nginx/sites-available/
cp /tmp/index.html /usr/share/nginx/html/
