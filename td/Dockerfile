FROM bywave/base

MAINTAINER jovani <jovani@bywave.com.au>

RUN locale-gen en_US.UTF-8
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir -p /etc/nginx/ssl
ADD ./ssl/nginx.crt /etc/nginx/ssl/nginx.crt
ADD ./ssl/nginx.key /etc/nginx/ssl/nginx.key

ADD run.sh /scripts/run.sh

RUN chmod 755 /scripts/*.sh

ADD nginx-td /etc/nginx/sites-available/td

RUN ln -s /etc/nginx/sites-available/td /etc/nginx/sites-enabled/td

RUN echo "127.0.0.1 	www.dev.transdirect.com.au" >> /var/hosts

EXPOSE 27017
EXPOSE 80
EXPOSE 443
EXPOSE 3360
EXPOSE 9001
EXPOSE 22

VOLUME ["/var/www"]

CMD ["/scripts/run.sh"]