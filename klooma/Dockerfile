FROM bywave/php53

MAINTAINER jovani <vojalf@gmail.com>

RUN locale-gen en_US.UTF-8
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8

ENV DEBIAN_FRONTEND noninteractive

ADD nginx-klooma /etc/nginx/sites-available/klooma
RUN ln -s /etc/nginx/sites-available/klooma /etc/nginx/sites-enabled/klooma

EXPOSE 27017
EXPOSE 80
EXPOSE 443
EXPOSE 3360
EXPOSE 9001

VOLUME ["/var/www"]

CMD ["/scripts/run.sh"]