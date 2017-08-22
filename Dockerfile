FROM 7.1-apache
MAINTAINER Nutthaphon Suwanwong
RUN (mv /etc/localtime /etc/localtime.old; ln -s /usr/share/zoneinfo/Asia/Bangkok /etc/localtime)
WORKDIR /var/www/html
COPY src/ /var/www/html/
EXPOSE 80
