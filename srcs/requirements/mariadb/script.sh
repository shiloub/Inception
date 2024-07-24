#!/bin/bash

service mysql start
mysql_secure_installation << EOF
${MYSQL_DB_PASS}
n
y
n
y
y
EOF

mysql -u root -p${MYSQL_DB_PASS} << EOF
CREATE DATABASE IF NOT EXISTS db_db ;
FLUSH PRIVILEGES;
CREATE USER IF NOT EXISTS "shiloub"@"wordpress.srcs_inception" IDENTIFIED BY "$MYSQL_DB_PASS";
GRANT ALL PRIVILEGES ON db_db.* TO "shiloub"@"wordpress.srcs_inception" IDENTIFIED BY "$MYSQL_DB_PASS";
ALTER USER 'root'@'localhost' IDENTIFIED BY "${MYSQL_DB_PASS}";
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_DB_PASS');
FLUSH PRIVILEGES;
EOF
sleep 3
service mysql stop
exec mysqld
