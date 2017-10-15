# Use the latest Ubuntu base image
FROM php:7.1-apache
MAINTAINER Kazuhei Arai <kazuhei0108@gmail.com>

# Silence debconf's endless prattle
ENV DEBIAN_FRONTEND noninteractive

# install php extensions
RUN apt-get update && \
    docker-php-ext-install pdo_mysql mysqli mbstring

# set up Apache environment variables
ENV APACHE_RUN_USER=www-data \
    APACHE_RUN_GROUP=www-data \
    APACHE_LOG_DIR=/var/log/apache2 \
    APACHE_LOCK_DIR=/var/lock/apache2 \
    APACHE_PID_FILE=/var/run/apache2.pid

# update the default apache site with the config we created.
RUN mkdir /www && mkdir /www/public
ADD apache-config-2.conf /etc/apache2/sites-enabled/000-default-2.conf
RUN echo "\n<FilesMatch \\.php$>\nSetHandler application/x-httpd-php\n</FilesMatch>" >> /etc/apache2/apache2.conf

# configure Apache for prefork and start server
RUN a2dismod mpm_event && a2enmod mpm_prefork && a2enmod rewrite && service apache2 restart
EXPOSE 80

CMD /bin/bash
