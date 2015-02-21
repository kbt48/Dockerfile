FROM centos:centos6
MAINTAINER Hiroki Kubota hiro.k.0805@gmail.com

# php-fpm intall
RUN yum update -y && \
yum install \
php php-fpm php-mbstring php-mysql php-pdo php-gd -y && \
yum clean all

ADD php-fpm.conf /etc/php-fpm.conf
ADD www.conf /etc/php-fpm.d/www.conf
RUN groupmod -g 1000 apache && usermod -u 1000 apache
RUN mkdir /usr/share/docroot

EXPOSE 9000

ENTRYPOINT ["/usr/sbin/php-fpm", "--nodaemonize"]
