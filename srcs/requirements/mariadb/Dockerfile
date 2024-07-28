# Base image for Debian, needed for MariaDB
FROM debian:bullseye

# Install and update package manager
RUN apt-get update -y &&  apt-get upgrade -y && apt-get install -y mariadb-server mariadb-client

COPY ./tools/s_mariadb.sh .
RUN chmod +x s_mariadb.sh

# Configuration changes: Modifies the MariaDB conf to listen on all network interfaces, not just enaam.42.fr
RUN sed -i "s|bind-address            = 127.0.0.1|bind-address            = 0.0.0.0|g" /etc/mysql/mariadb.conf.d/50-server.cnf
# change the enaam.42.fr settings to `0.0.0.0` makes DB accesssible form any IP , which is necessary for containerized env, where services

CMD ["./s_mariadb.sh"]
