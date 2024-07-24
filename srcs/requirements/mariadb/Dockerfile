FROM debian:buster
RUN apt-get upgrade -y
RUN apt-get update -y
RUN apt install mariadb-server -y
COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY script.sh script.sh
RUN chmod 777 script.sh
RUN mkdir /run/mysqld -p
RUN chown -R mysql:mysql /run/mysqld/
CMD ["./script.sh"]
