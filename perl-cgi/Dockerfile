FROM centos:centos6
MAINTAINER Hiroki Kubota hiro.k.0805@gmail.com

# php-fpm intall
RUN yum update -y && \
yum install \
perl perl-devel perl-CGI perl-FCGI -y && \
yum clean all

RUN groupmod -g 1000 apache && usermod -u 1000 apache
RUN mkdir /usr/share/docroot

EXPOSE 9001

ENTRYPOINT ["/usr/sbin/php-fpm", "--nodaemonize"]
