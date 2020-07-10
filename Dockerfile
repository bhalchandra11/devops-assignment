FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive
RUN apt update && apt install -y tcl
RUN apt-get -y install apache2
ADD . /var/www/html
ENTRYPOINT apachectl -D FOREGROUND
