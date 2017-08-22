FROM php:7.1-apache
MAINTAINER Nutthaphon Suwanwong
RUN (mv /etc/localtime /etc/localtime.old; ln -s /usr/share/zoneinfo/Asia/Bangkok /etc/localtime)
COPY src/ /var/www/html/
WORKDIR /var/www/html/upload
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
    && docker-php-ext-install -j$(nproc) iconv mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install -j$(nproc) zip \
    && docker-php-ext-configure mysqli --with-mysqli=mysqlnd \
    && docker-php-ext-install mysqli
RUN mv config-dist.php config.php \
    && mv admin/config-dist.php admin/config.php
RUN chmod 0777 system/storage/cache/ \
    && chmod 0777 system/storage/download/ \
    && chmod 0777 system/storage/logs/ \
    && chmod 0777 system/storage/modification/ \
    && chmod 0777 system/storage/session/ \
    && chmod 0777 system/storage/upload/ \
    && chmod 0777 system/storage/vendor/ \
    && chmod 0777 image/ \
    && chmod 0777 image/cache/ \
    && chmod 0777 image/catalog/ \
    && chmod 0777 config.php \
    && chmod 0777 admin/config.php
EXPOSE 80
