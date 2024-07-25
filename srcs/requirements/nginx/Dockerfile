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
## this command starts Nginx with the "deamon off;" directive
#### `Deamon off;` : keeps nginx running in foreground, this essential for Docker conatainers
####                 as the container will stop running if no foreground process is active


## IMPORTANT FORMATION ##
# Foreground Process is what keep a container active, Tapically a Container designed to stop when their main
# process finish executing --> means process needs a remain to keep the container alive

## -g daemon off; : By default , Nginx run as a deamon (background process) <which would cause the DockerContainer to exit immediately>


## DAEMONS : 
    # runs in the backGround
    # provide system services: handling webRequest, managing DataBases...