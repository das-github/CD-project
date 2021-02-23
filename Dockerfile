
FROM centos:latest
MAINTAINER dasgrasshopper@gmail.com
RUN yum install -y httpd \
  zip \
 unzip 
ADD https://www.free-css.com/assets/files/free-css-templates/download/page257/retro-doe.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip retro-doe.zip
RUN cp -rvf retro-doe/* .
RUN rm -rf retro-doe retro-doe.zip
CMD ["/usr/sbin/httpd", "-D",  "FOREGROUND"]
EXPOSE 80
