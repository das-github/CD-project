FROM ubuntu:18.0.4
RUN apt-get update 
RUN apt-get install –y apache2 
RUN apt-get install –y apache2-utils 
RUN apt-get clean \
 zip \
 unzip 
ADD https://www.free-css.com/assets/files/free-css-templates/download/page257/retro-doe.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip retro-doe.zip
RUN cp -rvf retro-doe/* .
RUN rm -rf retro-doe retro-doe.zip
EXPOSE 80 CMD [“apache2ctl”, “-D”, “FOREGROUND”]
