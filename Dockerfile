FROM php:7.1-apache
MAINTAINER Nutthaphon Suwanwong
RUN (mv /etc/localtime /etc/localtime.old; ln -s /usr/share/zoneinfo/Asia/Bangkok /etc/localtime)
COPY src/ /var/www/html/
WORKDIR /var/www/html/upload
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
