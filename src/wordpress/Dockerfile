FROM alpine:3.18

RUN apk update && apk upgrade && apk add --no-cache \
	icu-data-full \
    mariadb-client \
    tar \
	curl \
	php82 \
    php82-dev \
    php82-common \
    php82-gd \
    php82-xmlreader \
    php82-bcmath \
    php82-ctype \
    php82-curl \
    php82-exif \
    php82-iconv \
    php82-intl \
    php82-mbstring \
    php82-opcache \
    php82-openssl \
    php82-pcntl \
    php82-phar \
    php82-session \
    php82-xml \
    php82-xsl \
    php82-zip \
    php82-zlib \
    php82-dom \
    php82-fpm \
    php82-sodium \
    php82-tokenizer \
    php82-pecl-apcu \
	php82-mysqli \
    && ln -sf /usr/bin/php82 /usr/bin/php

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

RUN adduser -u 82 -D -S -G www-data www-data

COPY ./www.conf /etc/php82/php-fpm.d/www.conf
COPY ./php-fpm.conf /etc/php82/php-fpm.conf

COPY ./create.sh /usr/local/bin/
RUN chmod 777 /usr/local/bin/create.sh

ENTRYPOINT ["/usr/local/bin/create.sh"]

WORKDIR /var/www/html/wordpress

CMD ["/usr/sbin/php-fpm82", "-F"]