FROM centos:centos6
MAINTAINER Hiroki Kubota hiro.k.0805+github@gmail.com

# Install required software
# wget, Open JDK 7
RUN yum update -y && \
yum -y install wget java-1.7.0-openjdk

# Install Jenkins
RUN wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo && \
rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key && \
yum -y install jenkins && \
yum -y clean all

EXPOSE 8080
ENTRYPOINT service jenkins start && sleep 5 && tail -f /var/log/jenkins/jenkins.log
