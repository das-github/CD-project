FROM centos:latest
MAINTAINER dasgrasshopper@gmail.com
RUN yum -y update
RUN yum -y install httpd httpd-tools \
 zip \
unzip 
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
 && rpm -Uvh http://rpms.remirepo.net/enterprise/remi-release-7.rpm
  
ADD https://www.free-css.com/assets/files/free-css-templates/download/page257/retro-doe.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip retro-doe.zip
RUN cp -rvf retro-doe/* .
RUN rm -rf retro-doe retro-doe.zip
CMD ["/usr/sbin/httpd", "-D",  "FOREGROUND"]
EXPOSE 80 
