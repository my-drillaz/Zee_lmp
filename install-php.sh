#!/usr/bin/env bash

echo "installing epel-release"
yum -y install epel-release

rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

echo "install php"
yum -y install mod_php72w php72w-cli php72w-common php72w-devel php72w-pear php72w-gd php72w-mbstring php72w-mysql php72w-xml php72w-bcmath


echo "adding values to php.ini"
 max_execution_time=600
 max_input_time=600
 memory_limit=256M
 post_max_size=32M
 upload_max_filesize=16M
 date.timezone=America/Toronto

for key in max_execution_time max_input_time memory_limit post_max_size upload_max_filesize date.timezone
do
 sed -i "s/^\($key\).*/\1 $(eval echo \${$key})/" /etc/php.ini
done

echo "restart httpd"
systemctl restart httpd
