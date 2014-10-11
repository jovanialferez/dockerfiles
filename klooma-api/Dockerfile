FROM jovani/base-web

MAINTAINER jovani <vojalf@gmail.com>

RUN locale-gen en_US.UTF-8
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8

ENV DEBIAN_FRONTEND noninteractive

ADD run.sh /scripts/run.sh

RUN chmod 755 /scripts/*.sh

ADD nginx-klooma-api /etc/nginx/sites-available/klooma-api

RUN ln -s /etc/nginx/sites-available/klooma-api /etc/nginx/sites-enabled/klooma-api

ENV XDEBUG_CONFIG "remote_host=192.168.33.1 remote_port=9000 idekey=PHPSTORM"
ENV PHP_IDE_CONFIG "serverName=api.dev.klooma.com"

EXPOSE 27017
EXPOSE 80
EXPOSE 443
EXPOSE 3360
EXPOSE 9001
EXPOSE 22

VOLUME ["/var/www"]

CMD ["/scripts/run.sh"]