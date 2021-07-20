FROM centos:7

RUN yum update -y && yum clean all
RUN yum -y install httpd httpd-devel gcc* make && yum clean all

CMD [ "/usr/sbin/apachectl", "-DFOREGROUND" ]
