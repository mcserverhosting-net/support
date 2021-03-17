FROM debian:stretch
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_PID_FILE /var/run/apache2/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_LOG_DIR /var/log/apache2
ENV LANG C

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 wget \
    && wget https://dl-ssl.google.com/dl/linux/direct/mod-pagespeed-stable_current_amd64.deb -O /tmp/modpagespeed.deb \
    && dpkg -i /tmp/modpagespeed.deb

RUN mkdir -p /var/log/apache2 /var/run/apache2 /var/lock/apache2 \
    && chown www-data:www-data /var/log/apache2 /var/run/apache2 /var/lock/apache2
RUN mkdir /var/www/html/support
COPY public /var/www/html/support
RUN chown -R www-data:www-data /var/www/html

CMD ["apache2", "-DFOREGROUND"]

EXPOSE 80/tcp