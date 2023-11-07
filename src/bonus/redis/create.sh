#!/bin/sh
#echo "requirepass $REDIS_PASSWORD" >> /etc/redis.conf
echo "maxmemory 256mb" >> /etc/redis.conf
echo "maxmemory-policy allkeys-lru" >> /etc/redis.conf
sed -i -r "s/bind 127.0.0.1/# bind 127.0.0.1/" /etc/redis.conf
redis-server /etc/redis.conf --protected-mode no