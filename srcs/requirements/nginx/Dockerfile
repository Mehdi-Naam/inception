FROM debian:bullseye

## apt update : updates the package lists to ensure, got the latest information about
##              available packages
## apt upgrade: upgrades all installed packages to the latest formation

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y nginx && apt-get install openssl -y
## nginx  : high performance webserver, known of his stabiliy, simple configuration, low resource consumption
## openssl: which essential for generating SSL Certificates and ensure secure comminucation over HTTPS

COPY ./conf/nginx.conf ./etc/nginx/sites-available/default

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/ngnix-selfsigned.key \
    -out /etc/ssl/certs/ngnix-selfsigned.crt \
    -subj "/C=MO/L=KH/O=1337/OU=student/CN=dawdaw"

# run Nginx in the foreground:
CMD [ "nginx", "-g", "daemon off;"]
