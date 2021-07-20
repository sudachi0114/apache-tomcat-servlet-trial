FROM centos:7

RUN yum update -y && yum clean all
RUN yum -y install httpd httpd-devel gcc* make && yum clean all

ADD httpd-proxy.conf /etc/httpd/conf.d/

CMD [ "/usr/sbin/apachectl", "-DFOREGROUND" ]
