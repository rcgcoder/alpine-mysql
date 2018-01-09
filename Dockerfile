FROM alpine:latest
MAINTAINER WangXian <xian366@126.com>


RUN apk update

WORKDIR /app
VOLUME /app
COPY startup.sh /startup.sh
COPY mysql-plugins/calc_distance_udf.so /usr/lib/mysql/plugin/calc_distance_udf.so

RUN apk add --update mysql mysql-client nfs-utils && rm -f /var/cache/apk/*
COPY my.cnf /etc/mysql/my.cnf

EXPOSE 3306
CMD ["/startup.sh"]
