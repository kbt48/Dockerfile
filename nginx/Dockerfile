FROM ubuntu:14.04.1
MAINTAINER Hiroki Kubota hiro.k.0805+github@gmail.com

# disable interactive installation
ENV DEBIAN_FRONTEND noninteractive

# nginx intall
RUN \
apt-get update -y && \
apt-get upgrade -y && \
apt-get install nginx-extras -y --no-install-recommends && \
apt-get autoremove -y && \
apt-get clean -y 

# set config files
ADD nginx.conf /etc/nginx/nginx.conf
RUN rm /etc/nginx/sites-available/default

EXPOSE 80

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
