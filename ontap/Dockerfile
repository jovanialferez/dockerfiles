FROM ubuntu:trusty

MAINTAINER jovani <vojalf@gmail.com>

# so we get the neareset mirror
RUN sed -i '1s@^@deb mirror://mirrors.ubuntu.com/mirrors.txt precise-security main restricted universe multiverse\n@' /etc/apt/sources.list
RUN sed -i '1s@^@deb mirror://mirrors.ubuntu.com/mirrors.txt precise-backports main restricted universe multiverse\n@' /etc/apt/sources.list
RUN sed -i '1s@^@deb mirror://mirrors.ubuntu.com/mirrors.txt precise-updates main restricted universe multiverse\n@' /etc/apt/sources.list
RUN sed -i '1s@^@deb mirror://mirrors.ubuntu.com/mirrors.txt precise main restricted universe multiverse\n@' /etc/apt/sources.list

RUN locale-gen en_US.UTF-8
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

RUN apt-get -y install nginx mysql-server vim supervisor openssh-server git

RUN apt-get -y install php5-fpm php5-mysql php-apc php5-imagick php5-imap php5-mcrypt php5-curl php5-cli php5-gd php5-common php-pear curl php5-json php5-xdebug

RUN echo "cgi.fix_pathinfo = 0;" >> /etc/php5/fpm/php.ini

RUN echo "xdebug.remote_enable=On" >> /etc/php5/fpm/conf.d/20-xdebug.ini
RUN echo "xdebug.remote_autostart=On" >> /etc/php5/fpm/conf.d/20-xdebug.ini
RUN echo "xdebug.remote_connect_back=On" >> /etc/php5/fpm/conf.d/20-xdebug.ini

# this seems to be manually loaded
RUN php5enmod mcrypt

# mongoDb
RUN \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
  echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list && \
  apt-get update && \
  apt-get install -y mongodb-org && \
  mkdir -p /data/db

RUN apt-get install -y php5-mongo memcached php5-memcache

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/
RUN mv /usr/bin/composer.phar /usr/bin/composer

RUN mkdir /var/www && touch /var/www/dummy.txt && chown -R www-data:www-data /var/www

RUN mkdir /scripts/

ADD start-mysqld.sh /scripts/start-mysqld.sh
ADD create_mysql_admin_user.sh /scripts/create_mysql_admin_user.sh
ADD run.sh /scripts/run.sh

RUN chmod 755 /scripts/*.sh

ADD nginx-default /etc/nginx/sites-available/default
ADD nginx.conf /etc/nginx/nginx.conf
ADD my.cnf /etc/mysql/conf.d/my.cnf

ADD supervisord-mysqld.conf /etc/supervisor/conf.d/supervisord-mysqld.conf
ADD supervisord-nginx.conf /etc/supervisor/conf.d/supervisord-nginx.conf
ADD supervisord-mongod.conf /etc/supervisor/conf.d/supervisord-mongod.conf
ADD supervisord-php.conf /etc/supervisor/conf.d/supervisord-php.conf

RUN echo "[inet_http_server]" >> /etc/supervisor/supervisord.conf
RUN echo "port=*:9001" >> /etc/supervisor/supervisord.conf

EXPOSE 27017
EXPOSE 80
EXPOSE 443
EXPOSE 3360
EXPOSE 9001

VOLUME ["/var/www"]

CMD ["/scripts/run.sh"]