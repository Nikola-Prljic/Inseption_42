FROM alpine:3.18

RUN apk update && apk upgrade && apk add --no-cache \
    nginx=1.24.0-r7 \
    openssl=3.1.4-r0

RUN mkdir -p /run/nginx
#RUN mkdir -p /var/www/html/bonus/img

#RUN adduser -u 82 -D -S -G www-data www-data
#RUN chown -R www-data:www-data /var/www/html/bonus/img

COPY ssl_dev.conf /etc/nginx/http.d/ssl_dev.conf

RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx-selfsigned.key -out /etc/nginx/ssl/nginx-selfsigned.crt -subj "/C=AT/L=VIENNA/O=VIENNA/OU=student/CN=nprljic.42.fr/"
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/bonus-nginx-selfsigned.key -out /etc/nginx/ssl/bonus-nginx-selfsigned.crt -subj "/C=AT/L=VIENNA/O=VIENNA/OU=student/CN=bonus.nprljic.42.fr/"
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/minio-nginx-selfsigned.key -out /etc/nginx/ssl/minio-nginx-selfsigned.crt -subj "/C=AT/L=VIENNA/O=VIENNA/OU=student/CN=minio.nprljic.42.fr/"
#RUN chmod 600 /etc/nginx/ssl/nginx-selfsigned.key /etc/nginx/ssl/nginx-selfsigned.crt /etc/nginx/ssl/bonus-nginx-selfsigned.key /etc/nginx/ssl/bonus-nginx-selfsigned.crt

CMD ["/bin/sh", "-c", "nginx -g 'daemon off;'; nginx -s reload;"]