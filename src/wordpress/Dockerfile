From debian:bullseye

RUN apt-get update

RUN apt install -y \
    wget \
	curl \
	bash \
	php \
	php-cgi \
	php-mysql \
	php-fpm \
	php-pdo \
	php-gd php-cli \
	php-mbstring \
	redis \
	php-redis \
	&& rm -rf /var/lib/apt/lists/*
#php

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY ./www.conf /etc/php/7.4/fpm/pool.d/

RUN mkdir /run/php

#we copy the script, give the right to launch it in local on our computer
COPY ./create.sh /usr/local/bin/
RUN chmod 777 /usr/local/bin/create.sh
ENTRYPOINT ["/usr/local/bin/create.sh"]

WORKDIR /var/www/html/


EXPOSE 9000

#CMD ["ls"]
CMD ["/usr/sbin/php-fpm7.4", "-F"]

#CMD ["php wp-cli.phar --info"]