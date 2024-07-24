FROM debian:buster
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install mariadb-client -y
RUN apt-get install php -y && apt-get install curl -y
RUN apt-get install  -y php7.3-fpm
RUN apt-get install -y php-mysql
RUN apt-get install -y wget
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod 777 wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN	chown -R root:root /var/www/wordpress
COPY www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf
COPY config.sh /config.sh
RUN chmod 777 config.sh
ENTRYPOINT ["bash", "config.sh"]

# RUN mkdir /var/www/html