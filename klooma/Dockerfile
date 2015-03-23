FROM jovani/php53

MAINTAINER jovani <vojalf@gmail.com>

RUN locale-gen en_US.UTF-8
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8

ENV DEBIAN_FRONTEND noninteractive

apt-get -y install python-software-properties
apt-add-repository ppa:chris-lea/node.js
apt-get update

RUN apt-get -y install nodejs

ADD nginx-klooma /etc/nginx/sites-available/klooma
RUN ln -s /etc/nginx/sites-available/klooma /etc/nginx/sites-enabled/klooma

ENV XDEBUG_CONFIG "remote_host=192.168.33.1 remote_port=9000 idekey=PHPSTORM"
ENV PHP_IDE_CONFIG serverName=www.dev.klooma.com

EXPOSE 27017
EXPOSE 80
EXPOSE 443
# EXPOSE 3306
EXPOSE 9001

VOLUME ["/var/www"]

CMD ["/scripts/run.sh"]