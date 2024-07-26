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

# this command generates a self-signed SSL/TLS certifacte and private key using OpenSSL :
    # `req `    : used to gen a certi signing requestj(CSR) or a self-signed certificate.
        # ` -x509 ` : option tells OpenSSL to gen a self-signed certif instead of CSR.
    
    # ` -nodes ` opt tells OpenSSL not to encrypt the private key with a passphrase
    # this means that private key will not be protected by a password and it will stored in plaintext.
    # this generally not reco for production environments, as it can make the key more vulnerable to unauthorized access.

    # ` -days `  : option specifies the number of days that the certificate should be valid for..
    # ` -newkey `: opt spc that a new private key should be generated
        # ' rsa:2048 ' arg tell OpenSLL to generate an RSA key with a length of 2048bits.
    # ` -keyout `: opt spc the file where the private key should be stored.
        # ' -out ' opt spc the file where the certificate should be stored.
    # ` -subj `  : opt spc the subject of the certificate
    #               the subj includes informations about the organization that the certificate will be
    #               used for, as will as information about the server where the certi will be installed.
            #  in our case the subj includes: 
                # << C =MO >>: the country.
                # << L =KH >>: the location.
                # << O =1337>: the Organization
                # << OU=std>>: the Organization Unit (*student)
                # << CN=zakbouha.42.ma >: the common name
    # N.B :
        # after run this command the self-signed SSL/TLS certificate and private key will gen and stored on the
        # specified files.
        # you can use these files to conf an NGINX server to use SSL/TLS encryption
        # keep in mind that self-signed certi are not trusted by most web browsers
        # -> typically u'll need to obtain c*ertificate from trusted certif authority (CA) for use in a production env