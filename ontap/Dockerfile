FROM jovani/base

MAINTAINER jovani <jovani@bywave.com.au>

RUN locale-gen en_US.UTF-8
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y install beanstalkd

ADD run.sh /scripts/run.sh

RUN chmod 755 /scripts/*.sh

ADD nginx-ontap /etc/nginx/sites-available/ontap

RUN ln -s /etc/nginx/sites-available/ontap /etc/nginx/sites-enabled/ontap

ADD supervisord-beanstalkd.conf /etc/supervisor/conf.d/supervisord-beanstalkd.conf

ENV LD_LIBRARY_PATH /override_lib
ENV XDEBUG_CONFIG "remote_host=192.168.33.1 remote_port=9000 idekey=PHPSTORM"
ENV PHP_IDE_CONFIG serverName=www.dev.ontapcars.com.au

EXPOSE 27017
EXPOSE 80
EXPOSE 443
EXPOSE 3306
EXPOSE 9001
EXPOSE 22
EXPOSE 11300

VOLUME ["/var/www"]

CMD ["/scripts/run.sh"]
