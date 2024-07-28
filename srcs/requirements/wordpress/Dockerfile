FROM debian:bullseye

WORKDIR /var/www/html

RUN rm -rf *

RUN apt-get update -y && apt upgrade -y

RUN apt-get install php php-fpm php-mysql curl -y
# PHP      : required to run WordPress
# php-fpm  : FastCGI-Process-Manager : necessary for porcessing PHP files
# php-mysql: extension to connect PHP to MySQL/MariaDB databases
# curl     : A tool to Transfer data from or to a server.

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp
# Download the WP-CLI phar file from the official repository
# chmod +x : Makes the downLoaded file executable
# move the exec to .../bin/wp to make it accessible from anywhere

RUN mkdir -p /run/php
# PHP-FPM will use this directory for its socket files
# -p : ensure the prent directories are created if they don't exit

RUN sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 9000|" /etc/php/7.4/fpm/pool.d/www.conf
# change the default socket listening path from a UnixSocket file to TCP/IP port 9000
# that allows nginx to communicate with PHP-FPM over network port, which is crucial
# when running PHP-FPM in a Docker container separate from Nginx

COPY ./tools/s_wordpress.sh .

RUN chmod +x s_wordpress.sh

CMD [ "./s_wordpress.sh" ]

# N.B:
    # The line where we change the listen to port 9000 is Important
    # PHP-FPM: usually listens on a UnixSocket, this is efficient when PHP and
    # Web server are on the same machine