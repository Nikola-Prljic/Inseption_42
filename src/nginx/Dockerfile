FROM debian:bullseye

RUN apt-get update

RUN apt install nginx -y openssl -y

RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx-selfsigned.key -out /etc/nginx/ssl/nginx-selfsigned.crt -subj "/C=AT/L=VIENNA/O=VIENNA/OU=student/CN=nprljic/"

COPY dev.conf /etc/nginx/conf.d/dev.conf
#COPY index.html /var/www/html/index.html
#COPY index.php /var/www/html/index.php
RUN mkdir -p /run/nginx

#COPY ./script.sh /
EXPOSE 443
#CMD ["./script.sh"]
CMD ["nginx", "-g", "daemon off;"]
