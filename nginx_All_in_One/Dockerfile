FROM centos:centos6
MAINTAINER Hiroki Kubota hiro.k.0805@gmail.com

# epel
RUN yum install -y http://ftp.riken.jp/Linux/centos/6/extras/x86_64/Packages/epel-release-6-8.noarch.rpm && \
yum update --enablerepo=epel -y

# supervisord
RUN yum install --enablerepo=epel -y supervisor

# nginx
RUN yum install http://nginx.org/packages/mainline/centos/6/x86_64/RPMS/nginx-1.7.10-1.el6.ngx.x86_64.rpm -y && \
groupmod -g 1000 nginx && usermod -u 1000 nginx && \
mkdir /usr/share/docroot

# php-fpm
RUN yum install --enablerepo=epel -y \
php php-fpm php-mbstring php-mysql php-pdo php-gd

# perl-cgi
RUN yum install --enablerepo=epel -y \
perl-CGI perl-FCGI && \
yum clean all

ADD config/supervisor/supervisord.conf /etc/supervisord.conf
ADD config/nginx/nginx.conf /etc/nginx/nginx.conf
ADD config/nginx/default.conf /etc/nginx/conf.d/default.conf
ADD config/php/php.ini /etc/php.ini
ADD config/php/php-fpm.conf /etc/php-fpm.conf
ADD config/php/www.conf /etc/php-fpm.d/www.conf
ADD config/perl/fastcgi-wrapper.pl /usr/local/sbin/fastcgi-wrapper

EXPOSE 80

CMD ["/usr/bin/supervisord"]
