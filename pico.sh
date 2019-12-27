#!/usr/bin/env bash

LINUX_VERSION_NAME=`sed -n -e '/PRETTY_NAME/ s/^.*=\|"\| .*//gp' /etc/*release`

if [[ ${LINUX_VERSION_NAME} == "Debian" ]]

then

if [ "$(whoami)" != "root" ]; then
    SUDO=sudo
fi

${SUDO} apt-get -y install apt-transport-https gnupg2 lsb-release ca-certificates curl
${SUDO} wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
${SUDO} curl -fsSL https://nginx.org/keys/nginx_signing.key | ${SUDO} apt-key add -
${SUDO} sh -c 'echo "deb http://nginx.org/packages/debian $(lsb_release -sc) nginx" > /etc/apt/sources.list.d/nginx.list'
${SUDO} sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
${SUDO} apt-get update
${SUDO} apt-get -y install nginx php7.4-cgi php-pear php7.4-mbstring php7.4-gd php7.4-zip php-apcu php7.4-fpm
cd /etc/nginx/conf.d
${SUDO} rm default.conf
${SUDO} wget https://raw.githubusercontent.com/codeandmedia/pico_deploy/master/default.conf
cd /etc/nginx
${SUDO} rm nginx.conf
${SUDO} wget https://raw.githubusercontent.com/codeandmedia/pico_deploy/master/nginx.conf
cd /var
${SUDO} mkdir www
${SUDO} curl -sSL https://getcomposer.org/installer | php
php composer.phar create-project picocms/pico-composer www
${SUDO} chown -R www-data:www-data /var/www
${SUDO} find /var/www/ -type d -exec chmod 755 {} \;
${SUDO} find /var/www/ -type f -exec chmod 644 {} \;
echo "Well done! We gotta reboot..."
sleep 5
${SUDO} reboot

elif [[ ${LINUX_VERSION_NAME} == "Ubuntu" ]]

then

if [ "$(whoami)" != "root" ]; then
    SUDO=sudo
fi

${SUDO} apt-get -y install apt-transport-https gnupg2 lsb-release ca-certificates curl
${SUDO} curl -fsSL https://nginx.org/keys/nginx_signing.key | ${SUDO} apt-key add -
${SUDO} sh -c 'echo "deb http://nginx.org/packages/ubuntu $(lsb_release -sc) nginx" > /etc/apt/sources.list.d/nginx.list'
${SUDO} add-apt-repository ppa:ondrej/php
${SUDO} apt-get update
${SUDO} apt-get -y install nginx php7.4-cgi php-pear php7.4-mbstring php7.4-gd php7.4-zip php-apcu php7.4-fpm
cd /etc/nginx/conf.d
${SUDO} rm default.conf
${SUDO} wget https://raw.githubusercontent.com/codeandmedia/pico_deploy/master/default.conf
cd /etc/nginx
${SUDO} rm nginx.conf
${SUDO} wget https://raw.githubusercontent.com/codeandmedia/pico_deploy/master/nginx.conf
cd /var
${SUDO} mkdir www
${SUDO} curl -sSL https://getcomposer.org/installer | php
php composer.phar create-project picocms/pico-composer www
${SUDO} chown -R www-data:www-data /var/www
${SUDO} find /var/www/ -type d -exec chmod 755 {} \;
${SUDO} find /var/www/ -type f -exec chmod 644 {} \;
echo "Well done! We gotta reboot..."
sleep 5
${SUDO} reboot

else

echo "Sorry, it works for Ubuntu and Debian only"

fi
