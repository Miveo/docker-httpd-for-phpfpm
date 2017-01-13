FROM centos/httpd
MAINTAINER Julien Guyon <j.guyon@miveo.fr>

# default value to connect to php-fpm
ENV PHP_HOST php
ENV PHP_PORT 9000

RUN rm /etc/httpd/conf.d/welcome.conf
ADD php-fpm.conf /etc/httpd/conf.d/

EXPOSE 80
EXPOSE 443
