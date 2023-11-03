FROM alpine:3.18

RUN apk update && apk add --no-cache --virtual \
    wget redis vim lsb-release gpg dpkg-dev dpkg

#RUN echo "requirepass $REDIS_PASSWORD" >> /etc/redis.conf
#RUN echo "maxmemory 256mb" >> /etc/redis.conf
#RUN echo "maxmemory-policy allkeys-lru" >> /etc/redis.conf
#RUN sed -i -r "s/bind 127.0.0.1/# bind 127.0.0.0/" /etc/redis.conf
#RUN sed -i -r "s/# requirepass foobared/requirepass a/" /etc/redis.conf

COPY ./create.sh /etc/create.sh
RUN chmod 777 /etc/create.sh
ENTRYPOINT [ "/etc/create.sh" ]

CMD ["redis-server", "/etc/redis.conf", "--protected-mode", "no"]