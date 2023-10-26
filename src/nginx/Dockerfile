FROM alpine:3.18

RUN apk update && apk upgrade && apk add --no-cache \
    nginx=1.24.0-r7 \
    openssl=3.1.4-r0

RUN mkdir -p /run/nginx

COPY ssl_dev.conf /etc/nginx/http.d/ssl_dev.conf

RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx-selfsigned.key -out /etc/nginx/ssl/nginx-selfsigned.crt -subj "/C=AT/L=VIENNA/O=VIENNA/OU=student/CN=nprljic.42.fr/"

CMD ["/bin/sh", "-c", "nginx -g 'daemon off;'; nginx -s reload;"]