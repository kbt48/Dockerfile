FROM centos:centos6
MAINTAINER Hiroki Kubota hiro.k.0805+github@gmail.com

# nginx intall
RUN yum update -y && \
	yum install "http://nginx.org/packages/rhel/6/x86_64/RPMS/nginx-1.6.2-1.el6.ngx.x86_64.rpm" -y && \
	yum clean all

ADD nginx.conf /etc/nginx/nginx.conf
ADD default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
