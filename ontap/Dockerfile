FROM bywave/base

MAINTAINER jovani <jovani@bywave.com.au>

RUN locale-gen en_US.UTF-8
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8

ENV DEBIAN_FRONTEND noninteractive

ADD run.sh /scripts/run.sh

RUN chmod 755 /scripts/*.sh

ADD nginx-ontap /etc/nginx/sites-available/ontap

RUN ln -s /etc/nginx/sites-available/ontap /etc/nginx/sites-enabled/ontap

ADD supervisord-mongod.conf /etc/supervisor/conf.d/supervisord-mongod.conf

EXPOSE 27017
EXPOSE 80
EXPOSE 443
EXPOSE 3360
EXPOSE 9001
EXPOSE 22

VOLUME ["/var/www"]

CMD ["/scripts/run.sh"]