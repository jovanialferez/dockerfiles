FROM jovani/apache
MAINTAINER jovani <vojalf@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update --fix-missing \
	&& apt-get install -y --fix-missing openjdk-7-jre-headless

RUN sed -i 's/cgi.fix_pathinfo = 0/cgi.fix_pathinfo = 1/g' /etc/php5/fpm/php.ini

RUN rm -rf /etc/apache2/sites-enabled/*.*
RUN rm -rf /etc/apache2/sites-available/*.*
ADD plexi.conf /etc/apache2/sites-available/plexi.conf
RUN ln -s /etc/apache2/sites-available/plexi.conf /etc/apache2/sites-enabled/plexi.conf

CMD ["/scripts/run.sh"]