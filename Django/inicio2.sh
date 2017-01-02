#!/bin/bash

#[CONFIG]

#[ssh]
sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

#[apache2]
cat /root/defaultapache >/etc/apache2/sites-available/$dominio.conf
/usr/sbin/service apache2 start
a2enmod rewrite
rm -rf /var/www/html/

a2ensite $dominio.conf
service apache2 restart

#[mysql]
sed -i "44 i innodb_use_native_aio = 0" /etc/mysql/my.cnf
/usr/sbin/service mysql start
DEBIAN_FRONTEND=noninteractive sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
/usr/bin/mysqladmin -u root password test1234
mysql --user=root --password=test1234 -e "CREATE DATABASE IF NOT EXISTS $DBName DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;"
mysql --user=root --password=test1234 -e "GRANT ALL ON $DBName.* TO '$DBUser'@'%' IDENTIFIED BY '$DBPass' WITH GRANT OPTION; FLUSH PRIVILEGES;"

mkdir /var/run/sshd
/usr/sbin/service apache2 restart
/usr/sbin/service mysql restart
/usr/sbin/sshd -D

