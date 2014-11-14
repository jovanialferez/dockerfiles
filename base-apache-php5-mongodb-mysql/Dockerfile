FROM ubuntu:trusty

MAINTAINER jovani <vojalf@gmail.com>

# so we get the neareset mirror
RUN sed -i '1s@^@deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-security main restricted universe multiverse\n@' /etc/apt/sources.list
RUN sed -i '1s@^@deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-backports main restricted universe multiverse\n@' /etc/apt/sources.list
RUN sed -i '1s@^@deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-updates main restricted universe multiverse\n@' /etc/apt/sources.list
RUN sed -i '1s@^@deb mirror://mirrors.ubuntu.com/mirrors.txt trusty main restricted universe multiverse\n@' /etc/apt/sources.list

RUN locale-gen en_US.UTF-8
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8

ENV DEBIAN_FRONTEND noninteractive

# mongoDb
RUN \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
  echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list && \
  apt-get update && \
  apt-get install -y mongodb-org && \
  mkdir -p /data/db

RUN apt-get -y install mysql-server vim supervisor openssh-server apache2

RUN apt-get -y install php5-fpm php5-mysql php-apc php5-imagick php5-imap php5-mcrypt php5-curl php5-cli php5-gd php5-common php-pear curl php5-json php5-xdebug php5-mongo memcached php5-memcache libapache2-mod-php5 libapache2-mod-fastcgi

ADD php5-www.conf /etc/php5/fpm/pool.d/www.conf
# RUN echo "cgi.fix_pathinfo = 0;" >> /etc/php5/fpm/php.ini
RUN echo "xdebug.remote_enable=On" >> /etc/php5/fpm/conf.d/20-xdebug.ini
RUN echo "xdebug.remote_autostart=On" >> /etc/php5/fpm/conf.d/20-xdebug.ini
RUN echo "xdebug.remote_connect_back=On" >> /etc/php5/fpm/conf.d/20-xdebug.ini

# this seems to be manually loaded
RUN /usr/sbin/php5enmod mcrypt

RUN echo "<?php phpinfo(); ?>" >> /var/www/html/info.php && chown -R www-data:www-data /var/www

RUN mkdir /scripts/

RUN mkdir /var/run/sshd

ADD run.sh /scripts/run.sh
ADD start-mysqld.sh /scripts/start-mysqld.sh
RUN chmod 755 /scripts/*.sh

ADD supervisord-sshd.conf /etc/supervisor/conf.d/supervisord-sshd.conf
ADD supervisord-php.conf /etc/supervisor/conf.d/supervisord-php.conf
ADD supervisord-mongod.conf /etc/supervisor/conf.d/supervisord-mongod.conf
ADD supervisord-apache.conf /etc/supervisor/conf.d/supervisord-apache.conf
ADD supervisord-mysqld.conf /etc/supervisor/conf.d/supervisord-mysqld.conf

RUN echo "[inet_http_server]" >> /etc/supervisor/supervisord.conf
RUN echo "port=*:9001" >> /etc/supervisor/supervisord.conf

ADD php5-fpm.conf /etc/apache2/conf-available/php5-fpm.conf
RUN rm -rf /etc/apache2/mods-enabled/php5.conf
RUN rm -rf /etc/apache2/mods-enabled/php5.conf
RUN ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load
RUN ln -s /etc/apache2/mods-available/actions.conf /etc/apache2/mods-enabled/actions.conf
RUN ln -s /etc/apache2/mods-available/actions.load /etc/apache2/mods-enabled/actions.load
RUN ln -s /etc/apache2/conf-available/php5-fpm.conf /etc/apache2/conf-enabled/php5-fpm.conf

ADD my.cnf /etc/mysql/conf.d/my.cnf

RUN mkdir -p /override_lib && cp /etc/hosts /var/ && cp /lib/x86_64-linux-gnu/libnss_files.so.2 /override_lib && sed -ie 's:/etc/hosts:/var/hosts:g' /override_lib/libnss_files.so.2

ENV export LD_LIBRARY_PATH /override_lib

EXPOSE 27017
EXPOSE 80
EXPOSE 443
EXPOSE 9001
EXPOSE 22
EXPOSE 3306

VOLUME ["/var/www"]

CMD ["/scripts/run.sh"]