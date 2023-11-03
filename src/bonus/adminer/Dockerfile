FROM alpine:3.18

RUN apk update && apk upgrade && apk add --no-cache \
    curl \
	less \
	mariadb-client \
	php82 \
	php82-fpm \
	php82-common \
	php82-session \
	php82-iconv \
	php82-json \
	php82-gd \
	php82-curl \
	php82-xml \
	php82-mysqli \
	php82-imap \
	php82-pdo \
	php82-pdo_mysql \
	php82-soap \
	php82-posix \
	php82-gettext \
	php82-ldap \
	php82-ctype \
	php82-dom \
	php82-simplexml

RUN \
	curl -L -O https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php && \
	mkdir -p /var/www/html/wordpress && \
	mv ./adminer-4.8.1.php /var/www/html/wordpress/adminer.php && \
	adduser -u 82 -D -S -G www-data www-data

COPY /www.conf /etc/php82/php-fpm.d/www.conf

EXPOSE 9000
STOPSIGNAL SIGQUIT

CMD ["php-fpm82", "--nodaemonize"]