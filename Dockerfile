# Base on latest CentOS image
FROM centos:latest

MAINTAINER “Jonathan Ervine” <jon.ervine@gmail.com>
ENV container docker

# Install updates
RUN yum update -y; yum clean all
RUN yum install -y http://mirror.pnl.gov/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
RUN yum install -y mariadb-server supervisor
RUN yum clean all

ADD supervisord.conf /etc/supervisord.conf
ADD mariadb.ini /etc/supervisord.d/mariadb.ini

VOLUME /config
VOLUME /data

EXPOSE 3306
ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
