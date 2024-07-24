FROM debian:buster
RUN apt-get update
RUN apt-get install -y nginx
RUN mkdir -p /etc/nginx/ssl
RUN apt-get install openssl -y
RUN openssl req -sha256 -nodes -newkey rsa:4096 -x509 -days 365 -nodes -keyout /etc/nginx/ssl/localhost.key -out /etc/nginx/ssl/localhost.pem -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=localhost/CN=localhost"
RUN apt-get update
RUN mkdir -p /var/run/nginx
COPY ./conf/nginx.conf /etc/nginx/sites-available/default
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html
RUN mv /var/www/html/index.nginx-debian.html /var/www/html/index.php
EXPOSE 443
CMD [ "nginx", "-g", "daemon off;" ]
