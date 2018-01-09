FROM alpine:latest
MAINTAINER WangXian <xian366@126.com>


RUN apk update

WORKDIR /app
VOLUME /app
COPY startup.sh /startup.sh
COPY mysql-plugins/* /usr/lib/mysql/plugin

RUN apk add --update mysql mysql-client nfs-utils
	&& rm -f /var/cache/apk/*
COPY my.cnf /etc/mysql/my.cnf

EXPOSE 3306
CMD ["/startup.sh"]
