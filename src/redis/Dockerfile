FROM alpine:3.18

RUN apk update && apk add --no-cache --virtual \
    wget redis vim lsb-release gpg dpkg-dev dpkg

#RUN /etc/redis.conf << "requirepass eYVX7EwVmmxKPCDmwMtyKVge8oLd2t8"
RUN echo "maxmemory 256mb" >> /etc/redis.conf

RUN echo "maxmemory-policy allkeys-lru" >> /etc/redis.conf

RUN sed -i -r "s/bind 127.0.0.1/#bind 127.0.0.0/" /etc/redis.conf

RUN sed -i -r "s/eYVX7EwVmmxKPCDmwMtyKVge8oLd2t8/# requirepass foobared/" /etc/redis.conf

#COPY conf_redis.sh /etc/conf_redis.sh
#RUN chmod 777 /etc/conf_redis.sh

#ENTRYPOINT [ "/etc/conf_redis.sh" ]

CMD ["redis-server", "/etc/redis.conf", "--protected-mode", "no"]
